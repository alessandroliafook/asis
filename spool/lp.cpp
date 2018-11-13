#include <sys/types.h>
#include <bits/stdc++.h>
#include <unistd.h> 

using namespace std; 
int setuid(uid_t uid);

int main(int argc, char* argv[]) {
    setuid(0);
    string cmd = "./lp.sh";

    for (int i = 1; i < argc; i++) {
      cmd = cmd + " " +  argv[i];
    }

    system(cmd.c_str());

    return 0;
}
