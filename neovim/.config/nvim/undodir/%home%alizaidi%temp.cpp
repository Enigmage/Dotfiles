Vim�UnDo� 5�-�{�p}�¶Ñ�#�^���d�[G�w5   g                                  aݜ+    _�                             ����                                                                                                                                                                                                                                                                                                                                                             a���    �                   �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                       [           V        aݛ�     �              [   +// A C++ Program to detect cycle in a graph   #include<bits/stdc++.h>       using namespace std;       class Graph   {        int V;    // No. of vertices   H    list<int> *adj;    // Pointer to an array containing adjacency lists   N    bool isCyclicUtil(int v, bool visited[], bool *rs);  // used by isCyclic()   public:   "    Graph(int V);   // Constructor   <    void addEdge(int v, int w);   // to add an edge to graph   I    bool isCyclic();    // returns true if there is a cycle in this graph   };       Graph::Graph(int V)   {       this->V = V;       adj = new list<int>[V];   }       !void Graph::addEdge(int v, int w)   {   0    adj[v].push_back(w); // Add w to v’s list.   }       \// This function is a variation of DFSUtil() in https://www.geeksforgeeks.org/archives/18212   ?bool Graph::isCyclicUtil(int v, bool visited[], bool *recStack)   {       if(visited[v] == false)       {   G        // Mark the current node as visited and part of recursion stack           visited[v] = true;           recStack[v] = true;       =        // Recur for all the vertices adjacent to this vertex           list<int>::iterator i;   7        for(i = adj[v].begin(); i != adj[v].end(); ++i)   	        {   F            if ( !visited[*i] && isCyclicUtil(*i, visited, recStack) )                   return true;   "            else if (recStack[*i])                   return true;   	        }           }   C    recStack[v] = false;  // remove the vertex from recursion stack       return false;   }       :// Returns true if the graph contains a cycle, else false.   X// This function is a variation of DFS() in https://www.geeksforgeeks.org/archives/18212   bool Graph::isCyclic()   {   E    // Mark all the vertices as not visited and not part of recursion       // stack        bool *visited = new bool[V];   !    bool *recStack = new bool[V];       for(int i = 0; i < V; i++)       {           visited[i] = false;           recStack[i] = false;       }       F    // Call the recursive helper function to detect cycle in different       // DFS trees       for(int i = 0; i < V; i++)   /        if (isCyclicUtil(i, visited, recStack))               return true;           return false;   }       
int main()   {   0    // Create a graph given in the above diagram       Graph g(4);       g.addEdge(0, 1);       g.addEdge(0, 2);       g.addEdge(1, 2);       g.addEdge(2, 0);       g.addEdge(2, 3);       g.addEdge(3, 3);           if(g.isCyclic())   '        cout << "Graph contains cycle";       else   .        cout << "Graph doesn't contain cycle";       return 0;   }5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        aݛ�     �                   �               5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        aݜ*    �              g   4// A union-find algorithm to detect cycle in a graph   #include <bits/stdc++.h>   using namespace std;       ,// a structure to represent an edge in graph   class Edge    {   public:       int src, dest;   };       #// a structure to represent a graph   class Graph    {   public:   2    // V-> Number of vertices, E-> Number of edges       int V, E;       0    // graph is represented as an array of edges       Edge* edge;   };       .// Creates a graph with V vertices and E edges    Graph* createGraph(int V, int E)   {       Graph* graph = new Graph();       graph->V = V;       graph->E = E;       4    graph->edge = new Edge[graph->E * sizeof(Edge)];           return graph;   }       8// A utility function to find the subset of an element i   int find(int parent[], int i)   {       if (parent[i] == -1)           return i;   #    return find(parent, parent[i]);   }       0// A utility function to do union of two subsets   &void Union(int parent[], int x, int y)   {       parent[x] = y;   }       <// The main function to check whether a given graph contains   // cycle or not   int isCycle(Graph* graph)   {   -    // Allocate memory for creating V subsets   2    int* parent = new int[graph->V * sizeof(int)];       4    // Initialize all subsets as single element sets   /    memset(parent, -1, sizeof(int) * graph->V);       9    // Iterate through all edges of graph, find subset of   7    // both vertices of every edge, if both subsets are   *    // same, then there is cycle in graph.   (    for (int i = 0; i < graph->E; ++i) {   1        int x = find(parent, graph->edge[i].src);   2        int y = find(parent, graph->edge[i].dest);               if (x == y)               return 1;               Union(parent, x, y);       }       return 0;   }       // Driver code   
int main()   {   (    /* Let us create the following graph   	        0           | \           |  \           1---2 */       int V = 3, E = 3;   %    Graph* graph = createGraph(V, E);           // add edge 0-1       graph->edge[0].src = 0;       graph->edge[0].dest = 1;           // add edge 1-2       graph->edge[1].src = 1;       graph->edge[1].dest = 2;           // add edge 0-2       graph->edge[2].src = 0;       graph->edge[2].dest = 2;           if (isCycle(graph))   '        cout << "graph contains cycle";       else   .        cout << "graph doesn't contain cycle";           return 0;   }�   g            5��