#include <iostream>
#include <fstream>
#include <thread>
#include <cstdlib>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <unistd.h>
#include <ctime>
#include <time.h>
#include <mutex>
#include <chrono>
using namespace std;
char sip[100],cip[100];
int flag=1;

int thread_client(){
  int portNum,remainder;
    while(1){
        if(flag==1){
            flag=1;
            int client;
            bool isExit = false;
            int bufsize = 10;
            portNum=8089;
            struct sockaddr_in server_addr;
      
            l1: client = socket(AF_INET, SOCK_STREAM, 0);
            if (client < 0){
                 cout << "socket creation failed" << endl;
                goto l1;
            }
            else {
              cout << "socket creation success" << endl;
            }
            server_addr.sin_family = AF_INET;
            server_addr.sin_port = htons(portNum);
            inet_pton(AF_INET, cip, &server_addr.sin_addr);
            
           l2: 
           if (connect(client,(struct sockaddr *)&server_addr, sizeof(server_addr)) == 0) {
            while(1)
            {
                const int* buffer = new int[bufsize];
                send(client, buffer, bufsize, 0);
                cout<<"Sent"<<endl;
                delete []buffer;
                bufsize = max(100000 ,bufsize+5);
            }
        }
            else 
            {
                cout << "socket connection failed" << endl;
                goto l2;
            }
        }
    }
    return 0;
}

int main(int argc,const char* argv[]){
    cout<<"Enter server and client ports - ";
    strcpy(cip,argv[1]);
    thread t2(thread_client);
    t2.join();
    return 0;
}
