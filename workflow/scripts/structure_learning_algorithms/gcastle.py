from castle.algorithms import Notears
import pandas as pd
from contextlib import contextmanager
import time
import signal

from castle.common import BaseLearner, Tensor
from castle.common.independence_tests import CITest


@contextmanager
def timeoutf(timelimit, filename, time_filename, ntests_filename, start_time):
    # Register a function to raise a TimeoutError on the signal.
    signal.signal(signal.SIGALRM, raise_timeout)
    # Schedule the signal to be sent after ``time``.
    signal.alarm(timelimit)

    try:
        yield
    except TimeoutError:
        with open(filename, "w") as text_file:
            text_file.write("")

        tottime = time.perf_counter() - start_time
        with open(time_filename, "w") as text_file:
            text_file.write(str(tottime))

        # ntests is not applicable
        with open(ntests_filename, "w") as text_file:
            text_file.write("None")

    finally:
        # Unregister the signal so it won't be triggered
        # if the timeout is not reached.
        signal.signal(signal.SIGALRM, signal.SIG_IGN)


def raise_timeout(signum, frame):
    raise TimeoutError


def wrapper():
    seed = int(snakemake.wildcards["replicate"])
    # np.random.seed(seed)
    df = pd.read_csv(snakemake.input["data"])
    n = None
    if(snakemake.params["alg"] == "notears"):

        n = Notears(lambda1=float(snakemake.wildcards["lambda1"]),
                    loss_type=snakemake.wildcards["loss_type"],
                    max_iter=int(snakemake.wildcards["max_iter"]),
                    h_tol=float(snakemake.wildcards["h_tol"]),
                    rho_max=float(snakemake.wildcards["rho_max"]),
                    w_threshold=float(snakemake.wildcards["w_threshold"]))
        n.learn(df.values, columns=df.columns)

    elif(snakemake.params["alg"] == "pc"):
        from castle.algorithms import PC
        n = PC(variant=snakemake.wildcards["variant"],
               alpha=float(snakemake.wildcards["alpha"]),
               ci_test=snakemake.wildcards["ci_test"])
        n.learn(df.values, columns=df.columns)

    elif(snakemake.params["alg"] == "anm"):
        from castle.algorithms import ANMNonlinear
        n = ANMNonlinear(alpha=float(snakemake.wildcards["alpha"]))
        n.learn(df.values, columns=df.columns)

    elif(snakemake.params["alg"] == "direct_lingam"):
        from castle.algorithms import DirectLiNGAM

        n = DirectLiNGAM(prior_knowledge=None,
                         measure=snakemake.wildcards["measure"],
                         thresh=float(snakemake.wildcards["thresh"]))
        n.learn(df.values, columns=df.columns)
        
    elif(snakemake.params["alg"] == "ica_lingam"):
        from castle.algorithms import ICALiNGAM
        n = ICALiNGAM(random_state=seed,
                      max_iter=int(snakemake.wildcards["max_iter"]),
                      thresh=float(snakemake.wildcards["thresh"]))
        n.learn(df.values, columns=df.columns)

    elif(snakemake.params["alg"] == "notears_nonlinear"):
        from castle.algorithms import NotearsNonlinear
        n = NotearsNonlinear(lambda1=float(snakemake.wildcards["lambda1"]),
                             lambda2=float(
            snakemake.wildcards["lambda2"]),
            max_iter=int(
            snakemake.wildcards["max_iter"]),
            h_tol=float(
            snakemake.wildcards["h_tol"]),
            rho_max=float(
            snakemake.wildcards["rho_max"]),
            w_threshold=float(
            snakemake.wildcards["w_threshold"]),
            hidden_layer=int(
            snakemake.wildcards["hidden_layer"]),
            hidden_units=int(
            snakemake.wildcards["hidden_units"]),
            bias=eval(snakemake.wildcards["bias"]),
            model_type=snakemake.wildcards["model_type"],
            device_type=snakemake.wildcards["device_type"],
            device_ids=snakemake.wildcards["device_ids"])
        n.learn(df.values, columns=df.columns)

    elif(snakemake.params["alg"] == "notears_low_rank"):
        from castle.algorithms import NotearsLowRank

        n = NotearsLowRank(max_iter=int(snakemake.wildcards["max_iter"]),
                           h_tol=float(snakemake.wildcards["h_tol"]),
                           rho_max=float(snakemake.wildcards["rho_max"]),
                           w_threshold=float(snakemake.wildcards["w_threshold"]))

        n.learn(df.values, columns=df.columns, rank=int(snakemake.wildcards["rank"]))

    elif(snakemake.params["alg"] == "golem"):
        from castle.algorithms import GOLEM

        n = GOLEM(B_init=None,
                  lambda_1=float(snakemake.wildcards["lambda_1"]),
                  lambda_2=float(
            snakemake.wildcards["lambda_2"]),
            equal_variances=eval(snakemake.wildcards["equal_variances"]),
            non_equal_variances=eval(
            snakemake.wildcards["non_equal_variances"]),
            learning_rate=float(snakemake.wildcards["learning_rate"]),
            num_iter=float(snakemake.wildcards["num_iter"]),
            checkpoint_iter=int(snakemake.wildcards["checkpoint_iter"]),
            seed=seed,
            graph_thres=float(snakemake.wildcards["graph_thres"]),
            device_type=snakemake.wildcards["device_type"],
            device_ids=snakemake.wildcards["device_ids"])

        n.learn(df.values, columns=df.columns)

    elif(snakemake.params["alg"] == "grandag"):
        from castle.algorithms import GraNDAG
        
        n = GraNDAG(input_dim=df.shape[1],
                    hidden_num=int(snakemake.wildcards["hidden_num"]),
                    hidden_dim=int(snakemake.wildcards["hidden_dim"]),
                    batch_size=int(snakemake.wildcards["batch_size"]),
                    lr=float(snakemake.wildcards["lr"]),
                    iterations=int(snakemake.wildcards["iterations"]),
                    model_name=snakemake.wildcards["model_name"],
                    nonlinear=snakemake.wildcards["nonlinear"],
                    optimizer=snakemake.wildcards["optimizer"],
                    h_threshold=float(snakemake.wildcards["h_threshold"]),
                    device_type=snakemake.wildcards["device_type"],
                    use_pns=eval(snakemake.wildcards["use_pns"]),
                    pns_thresh=float(snakemake.wildcards["pns_thresh"]),
                    num_neighbors=None,
                    normalize=eval(snakemake.wildcards["normalize"]),
                    precision=eval(snakemake.wildcards["precision"]),
                    random_seed=seed,
                    jac_thresh=eval(snakemake.wildcards["jac_thresh"]),
                    lambda_init=float(snakemake.wildcards["lambda_init"]),
                    mu_init=float(snakemake.wildcards["mu_init"]),
                    omega_lambda=float(snakemake.wildcards["omega_lambda"]),
                    omega_mu=float(snakemake.wildcards["omega_mu"]),
                    stop_crit_win=int(snakemake.wildcards["stop_crit_win"]),
                    edge_clamp_range=float(
            snakemake.wildcards["edge_clamp_range"]),
            norm_prod=snakemake.wildcards["norm_prod"],
            square_prod=eval(snakemake.wildcards["square_prod"]))
        n.learn(df.values, columns=df.columns)

    elif(snakemake.params["alg"] == "mcsl"):
        from castle.algorithms import MCSL

        n = MCSL(model_type=snakemake.wildcards["model_type"],
                 hidden_layers=int(snakemake.wildcards["hidden_layers"]),
                 hidden_dim=int(snakemake.wildcards["hidden_dim"]),
                 graph_thresh=float(snakemake.wildcards["graph_thresh"]),
                 l1_graph_penalty=float(
            snakemake.wildcards["l1_graph_penalty"]),
            learning_rate=float(snakemake.wildcards["learning_rate"]),
            max_iter=int(snakemake.wildcards["max_iter"]),
            iter_step=int(snakemake.wildcards["iter_step"]),
            init_iter=int(snakemake.wildcards["init_iter"]),
            h_tol=float(snakemake.wildcards["h_tol"]),
            init_rho=float(snakemake.wildcards["init_rho"]),
            rho_thresh=float(snakemake.wildcards["rho_thresh"]),
            h_thresh=float(snakemake.wildcards["h_thresh"]),
            rho_multiply=float(snakemake.wildcards["rho_multiply"]),
            temperature=float(snakemake.wildcards["temperature"]),
            device_type=snakemake.wildcards["device_type"],
            device_ids=snakemake.wildcards["device_ids"],
            random_seed=seed)
        n.learn(df.values, columns=df.columns)

    elif(snakemake.params["alg"] == "gae"):
        from castle.algorithms import GAE

        n = GAE(seed=seed,
                x_dim=int(snakemake.wildcards["x_dim"]),
                num_encoder_layers=int(
                    snakemake.wildcards["num_encoder_layers"]),
                num_decoder_layers=int(
                    snakemake.wildcards["num_deoder_layers"]),
                hidden_size=int(snakemake.wildcards["hidden_size"]),
                latent_dim=int(snakemake.wildcards["latent_dim"]),
                l1_graph_penalty=float(
                    snakemake.wildcards["l1_graph_penalty"]),
                use_float64=eval(snakemake.wildcards["use_float64"]),
                learning_rate=float(snakemake.wildcards["learning_rate"]),
                max_iter=int(snakemake.wildcards["max_iter"]),
                iter_step=int(snakemake.wildcards["iter_step"]),
                init_iter=int(snakemake.wildcards["init_iter"]),
                h_tol=float(snakemake.wildcards["h_tol"]),
                init_rho=int(snakemake.wildcards["init_tol"]),
                rho_thresh=float(snakemake.wildcards["rho_thresh"]),
                h_thresh=float(snakemake.wildcards["h_thresh"]),
                rho_multiply=float(snakemake.wildcards["rho_multiply"]),
                early_stopping=eval(snakemake.wildcards["early_stopping"]),
                early_stopping_thres=float(
                    snakemake.wildcards["early_stopping_thresh"]),
                graph_thres=float(snakemake.wildcards["graph_thresh"]))

        n.learn(df.values, columns=df.columns)

    elif(snakemake.params["alg"] == "rl"):
        
        from castle.algorithms import RL
        n = RL(encoder_type=snakemake.wildcards["encoder_type"],
               hidden_dim=int(snakemake.wildcards["hidden_dim"]),
               num_heads=int(snakemake.wildcards["num_heads"]),
               num_stacks=int(snakemake.wildcards["num_stacks"]),
               residual=eval(snakemake.wildcards["residual"]),
               decoder_type=snakemake.wildcards["decoder_type"],
               decoder_activation=snakemake.wildcards["decoder_activation"],
               decoder_hidden_dim=int(
                   snakemake.wildcards["decoder_hidden_dim"]),
               use_bias=eval(snakemake.wildcards["use_bias"]),
               use_bias_constant=eval(
                   snakemake.wildcards["use_bias_constant"]),
               bias_initial_value=eval(
                   snakemake.wildcards["bias_initial_value"]),
               batch_size=int(snakemake.wildcards["batch_size"]),
               input_dimension=int(snakemake.wildcards["input_dimension"]),
               normalize=eval(snakemake.wildcards["normalize"]),
               transpose=eval(snakemake.wildcards["transpose"]),
               score_type=snakemake.wildcards["score_type"],
               reg_type=snakemake.wildcards["reg_type"],
               lambda_iter_num=int(snakemake.wildcards["lambda_iter_num"]),
               lambda_flag_default=eval(
                   snakemake.wildcards["lambda_flag_default"]),
               score_bd_tight=eval(snakemake.wildcards["score_bd_tight"]),
               lambda1_update=float(snakemake.wildcards["lambda1_update"]),
               lambda2_update=float(snakemake.wildcards["lambda2_update"]),
               score_lower=float(snakemake.wildcards["score_lower"]),
               score_upper=float(snakemake.wildcards["score_upper"]),
               lambda2_lower=float(snakemake.wildcards["lambda2_lower"]),
               lambda2_upper=float(snakemake.wildcards["lambda2_upper"]),
               seed=seed,
               nb_epoch=int(snakemake.wildcards["nb_epoch"]),
               lr1_start=float(snakemake.wildcards["lr1_start"]),
               lr1_decay_step=int(snakemake.wildcards["lr1_decay_step"]),
               lr1_decay_rate=float(snakemake.wildcards["lr1_decay_rate"]),
               alpha=float(snakemake.wildcards["alpha"]),
               init_baseline=float(snakemake.wildcards["init_baseline"]),
               temperature=float(snakemake.wildcards["temperature"]),
               C=float(snakemake.wildcards["C"]),
               l1_graph_reg=float(snakemake.wildcards["l1_graph_reg"]),
               inference_mode=eval(snakemake.wildcards["inference_mode"]),
               verbose=eval(snakemake.wildcards["verbose"]),
               device_type=snakemake.wildcards["device_type"],
               device_ids=int(snakemake.wildcards["device_ids"]))
        n.learn(df.values, columns=df.columns)

    elif(snakemake.params["alg"] == "corl"):

        from castle.algorithms.gradient.corl.torch import CORL

        n = CORL(batch_size=int(snakemake.wildcards["batch_size"]),
                 input_dim=int(snakemake.wildcards["input_dim"]),
                 embed_dim=int(snakemake.wildcards["embed_dim"]),
                 normalize=eval(snakemake.wildcards["normalize"]),
                 encoder_name=snakemake.wildcards["encoder_name"],
                  encoder_heads=int(snakemake.wildcards["encoder_heads"]),
                 encoder_blocks=int(snakemake.wildcards["encoder_blocks"]),
                 encoder_dropout_rate=float(
                 snakemake.wildcards["encoder_dropout_rate"]),
                 decoder_name=snakemake.wildcards["decoder_name"],
                 reward_mode=snakemake.wildcards["reward_mode"],
                 reward_score_type=snakemake.wildcards["reward_score_type"],
                 reward_regression_type=snakemake.wildcards["reward_regression_type"],
                 reward_gpr_alpha=float(snakemake.wildcards["reward_gpr_alpha"]),
                 iteration=int(snakemake.wildcards["iteration"]),
                 actor_lr=float(snakemake.wildcards["actor_lr"]),
                 critic_lr=float(snakemake.wildcards["critic_lr"]),
                 # for score function
                 alpha=float(snakemake.wildcards["alpha"]),
                 init_baseline=float(snakemake.wildcards["init_baseline"]),
                 random_seed=seed,
                 device_type=snakemake.wildcards["device_type"],
                 device_ids=int(snakemake.wildcards["device_ids"]))

        n.learn(df.values, columns=df.columns)

    # save time
    tottime = time.perf_counter() - start
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write(str(tottime))

    # save adjmat
    adjmat_df = pd.DataFrame(n.causal_matrix)
    adjmat_df.columns = df.columns
    adjmat_df.to_csv(snakemake.output["adjmat"], index=False)

    # ntests is not applicable
    with open(snakemake.output["ntests"], "w") as text_file:
        text_file.write("None")


start = time.perf_counter()
filename = snakemake.output["adjmat"]

if snakemake.wildcards["timeout"] == "None":
    wrapper()
else:
    with timeoutf(int(snakemake.wildcards["timeout"]),
                  filename,
                  snakemake.output["time"],
                  snakemake.output["ntests"],
                  start):
        wrapper()
