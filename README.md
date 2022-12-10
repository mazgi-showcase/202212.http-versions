# 202212.http-versions

:information_source: If you are using Linux, write out UID and GID into the `.env` file to let that as exported on Docker Compose as environment variables.

```console
test $(uname -s) = 'Linux' && {
  echo -e "GID=$(id -g)"
  echo -e "UID=$(id -u)"
} >> .env || :
```

#### Environment Variable Names

Environment variable names and uses are as follows.

| Name | Required on Linux | Value                                                                                                                                   |
| ---- | ----------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| UID  | **Yes**           | This ID number is used as UID for your Docker user, so this ID becomes the owner of all files and directories created by the container. |
| GID  | **Yes**           | The same as the above UID.                                                                                                              |
