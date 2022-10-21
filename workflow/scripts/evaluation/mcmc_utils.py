import math
import networkx as nx
import pandas as pd


def edges_str_to_list(str, edgesymb="-"):
    edges_str = str[1:-1].split(";")
    edges = [(edge.split(edgesymb)[0], edge.split(edgesymb)[1])
             for edge in edges_str if len(edge.split(edgesymb)) == 2]
    return edges


def get_node_order(df):
    # Check if directed and get the node order
    edges = edges_str_to_list(df["added"][0], edgesymb="->")
    if len(edges) != 0:
        g = nx.DiGraph()
        edgesymb = "->"
        nodeorder = []
        tmpedges = edges_str_to_list(df["added"][0], edgesymb="->")
        nodeorder.append(tmpedges[0][0])
        for edge in tmpedges:
            nodeorder.append(edge[1])

    else:
        g = nx.Graph()
        edgesymb = "-"
        nodeorder = []
        tmpedges = edges_str_to_list(df["added"][0], edgesymb)
        nodeorder.append(tmpedges[0][0])
        for edge in tmpedges:
            nodeorder.append(edge[1])
    return nodeorder

def get_edge_symb(df):
    # Check if directed and get the node order
    edges = edges_str_to_list(df["added"][0], edgesymb="->")
    if len(edges) != 0:
        return "->"

    else:
        return "-"

def estimate_heatmap(df, burnin_frac, edgesymb):
    
    # Check if directed and get the node order
    nodeorder = get_node_order(df)
    
    if edgesymb == "-":
        g = nx.Graph()
    elif edgesymb == "->":
        g = DiGraph()

    # Get the heatmap
    
    heatmap = None
    
    if "time" in df.columns:
        full_time = df["time"].iloc[-1]
        totaltime = math.ceil(full_time * (1.0- burnin_frac))
        
    full_its = df["index"].iloc[-1]        
    totalits = int(full_its * (1.0 - burnin_frac))
    
    burnin_ind = int(full_its * burnin_frac)

    # Bug some error here in mcmc_plots
    
    for index, row in df.iterrows():
        if row["index"] == 0:
            if burnin_ind == 0:
                heatmap = nx.to_numpy_array(g) #this is strange
            else:
                # Just to init the matrix with the right dimensions  
                heatmap = nx.to_numpy_array(g) * 0 

        if row["index"] > burnin_ind:
            
            if "time" in df.columns:
                cur_index = df["time"].iloc[index]
                prev_index = df["time"].iloc[index-1]
            else:
                cur_index = df["index"].iloc[index]
                prev_index = df["index"].iloc[index-1]
            weight = cur_index - prev_index            
            
            heatmap += nx.to_numpy_matrix(g, nodelist=nodeorder) * weight

        added = edges_str_to_list(row["added"], edgesymb)
        removed = edges_str_to_list(row["removed"], edgesymb)
        g.add_edges_from(added)
        g.remove_edges_from(removed)

    if "time" in df.columns:
        heatmap /= totaltime 
    else:
        heatmap /= totalits                             

    heatmap_df = pd.DataFrame(heatmap)
    heatmap_df.columns = g.nodes()
    return heatmap_df

def get_max_score_graph(df):
    edgesymb = get_edge_symb(df)
    if edgesymb == "-":
        g = nx.Graph()
    elif edgesymb == "->":
        g = DiGraph()

    
    maxscore = df[3:]["score"].max()
    for index, row in df.iterrows():
        added = edges_str_to_list(row["added"], edgesymb=edgesymb)
        removed = edges_str_to_list(row["removed"], edgesymb=edgesymb)
        g.add_edges_from(added)
        g.remove_edges_from(removed)
        if row["score"] == maxscore:
            break

    df_adjmat = pd.DataFrame(nx.to_numpy_array(g), dtype=int)
    df_adjmat.columns = g.nodes()
    return df_adjmat