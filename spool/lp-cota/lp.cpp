#include <sys/types.h>
#include <bits/stdc++.h>
#include <unistd.h> 

using namespace std; 

int setuid(uid_t uid);

int main(int argc, char* argv[]) {
    
    setuid(0);
    string root = "./lp-cota/lp.sh";

    for (int i = 1; i < argc; i++) {
      root = root + " " +  argv[i];
    }

    system(root.c_str());

    return 0;
}
