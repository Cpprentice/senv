# simple ENV (sENV)

simple ENV is a collection of scripts to enable certain simple environments based on environment variables.

The name is a hommage to the german word "Senf" which translates to "mustard".

## Powershell

In powershell there are some commandlets to modify show, enable and disable a certain senv.

## The .senv.conf file

The syntax of the file is like the following

```
<senv_name>|<env_variable>|<value>|<env_variable2>|<value2>
```

There can be as many `env_variable-value` pairs as necessary. You can specify the `PATH` variable multiple times since it will do a prepend each time. All other environment variables will be overwritten instead.

Example:
```
jre8|PATH|/some/install/path/bin|JAVA_HOME|/some/install/path
```

## Comparable tools

### [dotenvx](https://github.com/dotenvx/dotenvx)

dotenvx provides a CLI to manage and use different sets of environment configurations. However, it can only be used to start a certain command and needs to be placed in front of every command that needs the modified env variables. It is implemented as a node.js package.

```bash
dotenvx run -- node index.js
```

Sometimes this might even require to select the correct profile with each command.

### [dotenv-cli](https://github.com/venthur/dotenv-cli)

dotenv-cli seems to have a smaller amount of commands to manage the configurations but also allows to run an application by prepending the command when running an application. It is implemented in Python.

```bash
dotenv-cli node index.js
```

## Issues with the alternatives

None of the alternatives seems to be able to modify the env variables in a running terminal session - they always work on a per-command basis. That is ugly while running multiple commands in succession.

Moreover, it seems the only option is to do a full variable override - so no appending to the existing variable is possible. This is especially annoying with the PATH variable since it probably breaks all other commands that you would want to run from the terminal session as well.
However, it seems some implementations may allow to use a syntax like the following in the `.env` file to actually do variable updating instead.
```bash
variable=new_content:${variable}
```
