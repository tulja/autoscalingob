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
char *cip = "10.0.0.11";
int flag = 0;

int thread_server() {
    int client, server, k;
    int buffersize = (1 + 1) * sizeof(int);
    ofstream fout;

    int data[buffersize];
    struct sockaddr_in server_addr;
    socklen_t size;
    int portNum;
    /* ---------- ESTABLISHING SOCKET CONNECTION ----------*/
    /* --------------- socket() function ------------------*/
    portNum = 8089;
    server = socket(AF_INET, SOCK_STREAM, 0);

    if (server < 0)
    {
        cout << "server socket failed" << endl;
    }
    else {
        cout << "server socket success" << endl;
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(portNum);

    if ((bind(server, (struct sockaddr*)&server_addr, sizeof(server_addr))) < 0)
    {
        cout << "error in servers" << endl;
        return -1;
    }
    else
        cout << "bind success" << endl;

    size = sizeof(server_addr);
    listen(server, 10);
    int clientCount = 1;
    char* server_reply = new char[20000];
    while (1) {

        if ((client = accept(server, (struct sockaddr *)&server_addr, &size)) >= 0) {
            while (1) {
                if ( recv(client, server_reply , 20000 , 0) < 0)
                {
                    cout << "recv failed" << endl;
                    break;
                }
                else {
                    cout << "Received success" << endl;
                }
            }
        }
        else
            cout << "Received failed" << endl;
    }
}



int main(int argc, const char* argv[]) {
    cout << "Enter server and client ports - ";

    thread t1(thread_server);
    t1.join();
    return 0;
}
