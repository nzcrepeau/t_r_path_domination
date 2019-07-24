︠ddb83ac5-bbdd-4309-9a2f-ff534914559as︠
%time

#Based off the work of Erik Insko, Katie Johnson, David Blessing, and Christie Mauretour
#Created by Natasha Crepeau, Sean Hays, Alex Vasquez
#Series of helper functions for good_path_finder, which gives you the minimal dominating set of a path on n vertices

#findbrdcst: takes in a path and computes the distance between a vertex and the broadcast tower, output is a list of the indices where towers have been placed
def findbrdcst(pathpattern):
    brdcstset = []
    for i in range(len(pathpattern)):
        if pathpattern[i] == 1:
            brdcstset.append(i)
    return brdcstset

#reception_matrix: takes in a path pattern (as a list), outputs the reception at each vertex
def reception_matrix(pathpattern, t):
    k = len(pathpattern)
    G = [0]*k
    brdcstset = findbrdcst(pathpattern)
    for i in range(len(brdcstset)):
        for j in range(k):
            if abs(brdcstset[i] - j) <= t:
                G[j] = G[j] + t - abs(brdcstset[i] - j)
    return G


#checks to see if all vertices are receiving the required reception
#input: reception matrix, output: boolean and an optimal user friendly message!
def reception_check(receptionmatrix, r):
    for i in range(len(receptionmatrix)):
        if receptionmatrix[i] < r:
            #print "This is not a dominating set."
            return False
    return True


#path_creator creates paths given the number of towers and size of the path, and generates all the possible placements of towers
def path_creator(n, numtowers):
    basepath = [0]*(n-numtowers) + [1]*numtowers
    creations = Arrangements(basepath, n).list()
    return creations


##
#path_dom_numb takes in n, t, and r and outputs the number of towers required for the minimal dominating set of a path on n vertices
##
def path_dom_num(n,t,r):
    domnumber = ceil((n+r-1)/(2*t-r))
    return domnumber

#good_path_finder outputs paths that have a dominating set. takes in a set of paths on n vertices with towers distributed throughout
## (t,r) is broadcast domination
## n is the number of vertices
## numtowers is the number of towers you want the dominating set for

def good_path_finder(n, numtowers, t, r):
    pathset = path_creator(n, numtowers)
    goodpaths = []
    for i in range(len(pathset)):
        receptionmatrix = reception_matrix(pathset[i], t)
        if reception_check(receptionmatrix, r) == True: #tells you if this is a dominating set
            goodpaths.append(pathset[i])
    print "Your dominating sets are:"
    return goodpaths

##
#
#good_path_finder2 calculates the number of towers you need (based on our work) and shows you the minimal dominating set(s)
##
def good_path_finder2(n, t, r):
    numtowers = path_dom_num(n,t,r)
    pathset = path_creator(n, numtowers)
    goodpaths = []
    for i in range(len(pathset)):
        receptionmatrix = reception_matrix(pathset[i], t)
        if reception_check(receptionmatrix, r) == True: #tells you if this is a dominating set
            goodpaths.append(pathset[i])
    print "Your dominating sets are:"
    return goodpaths

good_path_finder2(10,2,1)

︡95822f56-edb4-4b1d-a359-7f9c5379eb08︡{"stdout":"Your dominating sets are:\n[[0, 1, 0, 0, 1, 0, 0, 1, 0, 1], [0, 1, 0, 0, 1, 0, 0, 1, 1, 0], [0, 1, 0, 0, 1, 0, 1, 0, 0, 1], [0, 1, 0, 0, 1, 0, 1, 0, 1, 0], [0, 1, 0, 0, 1, 1, 0, 0, 1, 0], [0, 1, 0, 1, 0, 0, 1, 0, 0, 1], [0, 1, 0, 1, 0, 0, 1, 0, 1, 0], [0, 1, 0, 1, 0, 1, 0, 0, 1, 0], [0, 1, 1, 0, 0, 1, 0, 0, 1, 0], [1, 0, 0, 1, 0, 0, 1, 0, 0, 1], [1, 0, 0, 1, 0, 0, 1, 0, 1, 0], [1, 0, 0, 1, 0, 1, 0, 0, 1, 0], [1, 0, 1, 0, 0, 1, 0, 0, 1, 0]]\n"}︡{"stdout":"\nCPU time: 0.02 s, Wall time: 0.08 s\n"}︡{"done":true}
︠06a62ef5-de7c-4a14-a0b5-8d0b9f2d4e8es︠

︡f26fcef2-0ee6-4b27-a7c0-e70a5b543517︡{"done":true}
︠efc6b722-2760-45c2-8d76-b46890d2a5e4︠









