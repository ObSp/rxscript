# rxscript
A roblox luau library that lets you get things done faster! Features more than 20 unique libraries all built into one module script. Will be published to roblox soon, in the meantime all the sourcecode is available here!

# main.lua
The main module containing all of the different modules.

# Camera.lua
A very small module that lets you easily switch between the main two camera types.

# CreateLeaderstats
A one-function module that makes it easier to create leaderstats.

# Create Zone
A rather big module to create and manage "Zones". This is very useful if you want different effects for different areas of your game, ex. music or lighting effects.

# CustomInstance
A small module that lets you create custom "Instances" with custom properties.

# Find
Ever gotten tired of finding an instance like this? 
```local part = workspace:FindFirstChild("Folder"):FindFirstChild("Model"):FindFirstChild("Part")```
This is a module that gets rid of that annoyance by letting you wait for that instance like this:
```local part = rxscript.Find(workspace, "Folder.Model.Part")```
This resolve's roblox's issue of dot notation.

# GetDataStore
A scalable, simple datastore module that makes saving data easier.

# Input
One of the most useful, if not the most useful modules in the rxscript library. Ever wanted to temporary disable an input function and enable it again after? Ever wanted to change the trigger of a UserInput function or replace the function bound to a specific action? This is what Input allows you to do. When called, it returns an "Input" object. Then, you can connect a function to it, disable it, re-enable it, change its trigger, and more.

# InstanceTypes
Just a place to store rxscript instances and return an empty object of them when called.

# NewInstance
A module to join roblox and rxscript instances by letting you create either one with the same function.

# RemoveFromTable
Roblox's way of removing a value from a table quickly get's annoying when you have to do it like this:
```table.remove(t, table.find(v))```
This module simply requires a table and a value to remove and returns the table without the value.

# Repeat
A very, very simple and quick module to repeat an action several times through rxscript.Repeat(repeats,action) instead of like this: for i=1, #repeats do. Very simple but useful!

# RunWithDelay
One of my personal favorites, it's a quick function to run a function after a certain delay. It utilizes a task.spawn function to make sure it doesn't yield the thread it was called from.

# SortTableByValue
A very useful module for things like global leaderboards. It accepts an array in this format: {k: any = v: number} and returns a list with the highest key at the top and the lowest at the bottom.

# Switch
An imitation of C#'s switch cases, it's essentially the same thing as an if statement with elseifs but cleaner.

# Timer
A very easy way to infinitely run a function every x seconds.

# Wait
Less useful than most modules in this library as it's essentially the same thing as task.wait(), it let's you yield the current thread for x seconds

# WaitFor
Ever gotten tired of waiting for an instance like this? 
```local part = workspace:WaitForChild("Folder"):WaitForChild("Model"):WaitForChild("Part")```
This is a module that gets rid of that annoyance by letting you wait for that instance like this:
```local part = rxscript.WaitFor(workspace, "Folder.Model.Part")```

# rxscript plugin
A plugin will be released very soon to easily insert the rxscript module whenever you want **and** to let you edit your default source code, manage which modules are included when you insert it via plugin, and add your own modules to the library!


# Thanks for reading! I hope to see you at release!
