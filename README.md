# Distributives-OfflineInstallers-SQL-Server-Management-Studio

## SSH-agent configuration on Windows 10

You should not use the Open SSH client that comes with Git for Windows.  
Instead, Windows 10 has its own implementation of Open SSH that is integrated with the system.  
To achieve this:

* Start the `ssh-agent` from Windows Services: Type Services in the Start Menu or `Win+R` and then type `services.msc` to launch the Services window.
* Find the OpenSSH Authentication Agent in the list and double click on it.
* In the OpenSSH Authentication Agent Properties window that appears, choose Automatic from the Startup type: dropdown and click Start from Service status. Make sure it now says Service status: Running.
* Configure Git to use the Windows 10 implementation of OpenSSH by issuing the following command in Powershell:

    ```bat
    git config --global core.sshCommand C:/Windows/System32/OpenSSH/ssh.exe
    ```

* Configure SSH to automatically add the keys to the agent on startup by editing the config file found at `C:\Users\%YOUR_USERNAME%\.ssh\config`, and add the following lines:

    ```text
    Host *
        AddKeysToAgent yes
        IdentitiesOnly yes
    ```

* You can also add the following lines if you generated an SSH key with custom name or multiple SSH keys:

    ```text
    Host github.com
        HostName github.com
        User your_user_name
        IdentityFile ~/.ssh/your_file_name
    ```

Add your SSH key to the `ssh-agent` by issuing the `ssh-add` command and entering your passphrase:

```bat
ssh-add $HOME/.ssh/your_file_name
```

Done! Now restart your Powershell and even Windows if necessary.
