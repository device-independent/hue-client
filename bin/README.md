# Executable Scripts

You can also interact with your _Hue Lighting System_ via the command
line with some helper executable scripts.

## Examples

> NOTE: These are samples of what the DSL will look like.

Most interactions will require a specified `bridge` to interact with. I
am considering allowing you to leave the `bridge-id` off and then
multi-assigning the details to all `bridges`.

### Portal/Bridges

```
bin/bridges all
bin/bridge show --id '1234'
bin/bridge update --id '1234' --args *args
```

### Users

```
bin/users all --bridge-id '1234'
bin/users create --bridge-id '1234' --args *args
bin/user show --bridge-id '1234' --id '1234'
bin/user update --bridge-id '1234' --id '1234' --args *args
bin/user delete --bridge-id '1234' --id '1234'
```

### Lights

```
bin/lights all --bridge-id '1234
bin/lights create --bridge-id '1234' --args *args
bin/light show --bridge-id '1234' --id '1234'
bin/light update --bridge-id '1234' --id '1234' --args *args --state *args
bin/light delete --bridge-id '1234' --id '1234'
```

### Groups

```
bin/groups all --bridge-id '1234'
bin/groups create --bridge-id '1234' --args *args
bin/group show --bridge-id '1234' --id '1234'
bin/group update --bridge-id '1234' --id '1234' --args *args --state *args
bin/group delete --bridge-id '1234' --id '1234'
```

### Schedules

```
bin/schedules all --bridge-id '1234'
bin/schedules create --bridge-id '1234' --args *args
bin/schedule show --bridge-id '1234' --id '1234
bin/schedule update --bridge-id '1234' --id '1234 --args *
bin/schedule delete --bridge-id '1234' --id '1234'
```

### Scenes

```
bin/scenes all --bridge-id '1234'
bin/scenes create --bridge-id '1234' --args *args
bin/scene show --bridge-id '1234' --id '1234
bin/scene update --bridge-id '1234' --id '1234' --args *args --state *args
bin/scene delete --bridge-id '1234' --id '1234'
```
