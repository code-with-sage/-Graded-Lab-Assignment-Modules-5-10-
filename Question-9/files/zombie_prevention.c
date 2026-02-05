#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    int i;
    pid_t pid;

    for (i = 0; i < 3; i++) {
        pid = fork();

        if (pid == 0) {
            // Child process
            printf("Child process created. PID = %d\n", getpid());
            sleep(2);
            exit(0);
        }
        else if (pid < 0) {
            perror("fork failed");
            exit(1);
        }
    }

    // Parent process cleans up child processes
    for (i = 0; i < 3; i++) {
        pid = wait(NULL);
        printf("Parent cleaned up child with PID = %d\n", pid);
    }

    return 0;
}
