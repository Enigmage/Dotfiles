Vim�UnDo� �Ͽ(y|[L��hV�����������b��*�   7           int p = 0, lc = 0;                            b�G    _�                             ����                                                                                                                                                                                                                                                                                                                                                             b�^    �   .                      for(int i �   /            �                   �               5�_�                       2    ����                                                                                                                                                                                                                                                                                                                                                             b��     �         5      7        sort(temp.begin(), temp.end(), greater<int>());5�_�                       8    ����                                                                                                                                                                                                                                                                                                                                                             b��    �         5      =        sort(temp.begin(), temp.end(), greater<pair<int,>());5�_�                       <    ����                                                                                                                                                                                                                                                                                                                                                             b��     �         6              �         5    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b��     �         6              for(auto i: temp)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b��     �         6              for(auto i: temp)5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b��     �         7      !            cout << i.first << ""5�_�      	                 "    ����                                                                                                                                                                                                                                                                                                                                                             b��    �         7      "            cout << i.first << " "5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b��    �                7            cout << i.first << " " << i.second << endl;�                        for(auto i: temp)5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b�V     �         7                  int left = i - 0;5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b��     �         7              int p = 0;5�_�                           ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b��     �         7                  int left = p;5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b��     �         8                  �         7    5�_�                           ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b��     �         8                  if(temp[i])5�_�                          ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b��     �         8                  if(temp[i] == )5�_�                           ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b��     �         8      !            if(temp[i].first == )5�_�                       '    ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b��     �         8      )            if(temp[i].first == temp[p] )5�_�                       /    ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b��    �         8      /            if(temp[i].first == temp[p].first )5�_�                           ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b�1    �         8                  int left = lc - 0;5�_�                           ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b�I     �                            int left = lc;5�_�                           ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b�L   
 �         7      '            res[i] = abs(left - right);5�_�                            ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b�p    �              7   // { Driver Code Starts   //Initial Template for C++       #include<bits/stdc++.h>    using namespace std;         // } Driver Code Ends    //User function Template for C++       class Solution{      public:   3    vector<int> greaterLesser(vector<int>A, int N){           // code here   $        vector<pair<int, int>> temp;   #        for(int i = 0; i < N; ++i)    &            temp.push_back({A[i], i});   B        sort(temp.begin(), temp.end(), greater<pair<int, int>>());           /* for(auto i: temp) */   =        /*     cout << i.first << " " << i.second << endl; */           vector<int> res(N);           int p = 0, lc = 0;   $        for(int i = 0; i < N; ++i) {   ;            if(temp[i].first == temp[p].first ) lc = i - 0;   4            while(temp[i].first == temp[p++].first);   %            int right = A.size() - p;   %            res[i] = abs(lc - right);   	        }           return res;       }   };       // { Driver Code Starts.       int main()    {    
    int t;       cin>>t;       while(t--)       {           int N;           cin >> N;           vector<int>A(N);   "        for(int i = 0; i < N; i++)               cin >> A[i];                      Solution ob;           vector<int>ans(N);   #        ans=ob.greaterLesser(A, N);   "        for(int i = 0; i < N; i++)   "            cout << ans[i] << " ";           cout << endl;       }       return 0;    }      // } Driver Code Ends�   7            5�_�                            ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b�G     �         7              int p = 0, lc = 0;ods5�_�                           ����                                                                                                                                                                                                                                                                                                                                         6       V   6    b��     �         8                  if(temp[i] ==  == )5��