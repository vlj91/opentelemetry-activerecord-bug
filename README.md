1. Create a task

```
http POST :3000/tasks title=test
```

2. Delete the task

```
http DELETE :3000/tasks/1
```

3. `ArgumentError` thrown for `#destroy`

```
ArgumentError (wrong number of arguments (given 1, expected 0)):
app/controllers/tasks_controller.rb:29:in `destroy'
```
