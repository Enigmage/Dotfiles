Vim�UnDo� ̆i\�u��	;��4e���ݏ����(� �J                                      b1�c    _�                             ����                                                                                                                                                                                                                                                                                                                                                             b1�Z     �                   �               5��                                          j      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b1�[     �              5��                                                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b1�\     �                 �              5��                                                  �                                                  �                                                �                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b1�^    �                pbs5��                                                  �                                          �       5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             b1�b    �                 #include<bits/stdc++.h>    using namespace std;       !#define LOG(x) cout << x << endl;   typedef vector<int> vi;   typedef vector<bool> vb;   typedef vector<string> vs;       class Solution {       vector<vector<int>> res;   U    void backtrack(const vector<int>& can, int target, vector<int> temp, int index) {           if(target == 0) {                res.push_back(temp);               return;   	        }           if(target < 0) return;   1        for(int i = index; i < can.size(); ++i) {   #            temp.push_back(can[i]);   5            backtrack(can, target - can[i], temp, i);               temp.pop_back();   	        }       }   public:   M    vector<vector<int>> combinationSum(vector<int>& candidates, int target) {           res.clear();   -        backtrack(candidates, target, {}, 0);           return res;       }   };�               5��                          	                    �                                   	              5��