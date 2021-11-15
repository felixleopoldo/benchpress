import signal
from contextlib import contextmanager
from numpy import column_stack
import notears
import argparse
import pandas as pd
import sys 

@contextmanager
def timeoutf(time, filename):
    # Register a function to raise a TimeoutError on the signal.
    signal.signal(signal.SIGALRM, raise_timeout)
    # Schedule the signal to be sent after ``time``.
    signal.alarm(time)

    try:
        yield
    except TimeoutError:
        with open(filename, "w") as text_file:
            text_file.write("")
    finally:
        # Unregister the signal so it won't be triggered
        # if the timeout is not reached.
        signal.signal(signal.SIGALRM, signal.SIG_IGN)

def raise_timeout(signum, frame):
    raise TimeoutError

def run_alg(loss, loss_grad, min_rate_of_progress, penalty_growth_rate,
         optimation_accuracy, seed, filename, data_filename):

    loss_func = None
    if loss == "least_squares_loss":
        loss_func = notears.loss.least_squares_loss
    elif loss == "least_squares_loss_cov":
        loss_func = notears.loss.least_squares_loss_cov

    loss_grad_func = None
    if loss_grad == "least_squares_loss_grad":
        loss_grad_func = notears.loss.least_squares_loss_grad
    elif loss_grad == "least_squares_loss_cov_grad":
        loss_grad_func = notears.loss.least_squares_loss_cov_grad

    data_df = pd.read_csv(data_filename, sep=",")

    output_dict = notears.run(
        notears.notears_standard,
        data_df.values,
        loss_func,
        loss_grad_func,
        e=optimation_accuracy,
        r=penalty_growth_rate,
        c=min_rate_of_progress,
        verbose=False)

    adjmat = notears.utils.threshold_output(output_dict['W'])

    adjmat_df = pd.DataFrame(adjmat)
    adjmat_df.columns = data_df.columns
    adjmat_df.to_csv(filename, index=False)

def main(loss, loss_grad, min_rate_of_progress, penalty_growth_rate,
         optimation_accuracy, timeout, seed, filename, data_filename):

    if timeout == "None":
        run_alg(loss, loss_grad, min_rate_of_progress, penalty_growth_rate, optimation_accuracy, seed, filename, data_filename)
    else:
        with timeoutf(int(timeout), filename):
            run_alg(loss, loss_grad, min_rate_of_progress, penalty_growth_rate, optimation_accuracy, seed, filename, data_filename)

if __name__ == "__main__":
    parser = argparse.ArgumentParser("NOTEARS.")

    parser.add_argument(
        '-c', '--min_rate_of_progress',
        type=float, required=True
    )
    parser.add_argument(
        '-r', '--penalty_growth_rate',
        type=float, required=True
    )
    parser.add_argument(
        '-e', '--optimation_accuracy',
        type=float, required=True
    )
    parser.add_argument(
        '-l', '--loss',
        type=str, required=True
    )
    parser.add_argument(
        '-g', '--loss_grad',
        type=str, required=True
    )
    parser.add_argument(
        '-t', '--timeout',
        type=str, required=True
    )

    parser.add_argument(
        '-s', '--seed',
        type=int, required=True
    )
    parser.add_argument(
        '-F', '--filename',
        required=True,
        help="Output filename"
    )
    parser.add_argument(
        '-d', '--data_filename',
        required=True,
        help="Data filename"
    )

    args = parser.parse_args()
    main(**args.__dict__)
