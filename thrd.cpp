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

int thread_server(){
    int client, server,k;
    int buffersize=(1+1)*sizeof(int);
    ofstream fout;
        
       int data[buffersize];
       struct sockaddr_in server_addr;
    socklen_t size;
    int portNum;
    /* ---------- ESTABLISHING SOCKET CONNECTION ----------*/
    /* --------------- socket() function ------------------*/
portNum=8089;
    server = socket(AF_INET, SOCK_STREAM, 0);

    if (server < 0) 
    {
         }

    
    

    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(portNum);

    if ((bind(server, (struct sockaddr*)&server_addr,sizeof(server_addr))) < 0) 
    {
        cout<<"error in servers";
        return -1;
    }

    
    size = sizeof(server_addr);
    listen(server, 10);
    int clientCount = 1;
    while(1){
    if ((client = accept(server,(struct sockaddr *)&server_addr,&size)) >= 0) {
        while(1)
        {
        flag=1;
        cout<<"Received"<<endl;
        }
    }
    
    }
}


int main(int argc,const char* argv[]){
    thread t1(thread_server);
    t1.join();
    return 0;
}