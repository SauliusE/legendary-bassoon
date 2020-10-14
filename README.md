# legendary-bassoon

## Repository for the jenkins and jcasc learning purpose

Get list of installed plugins and their version:
```
def pluginList = new ArrayList(Jenkins.instance.pluginManager.plugins)
pluginList.sort { it.getShortName() }.each{
  plugin -> 
    println ("${plugin.getShortName()}:${plugin.getVersion()}")
}
null
```