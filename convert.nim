import asyncdispatch,httpclient,json,strutils


proc convertGithub(jsonStr:string,source:string = "git@git.zhlh6.cn:"): string =
  ## this proc only convert gitrepo from github
  ## 
  ## [jsonStr] is packges.json from nimblepkg
  ## 
  ## [source] like git@github.com: default is git@git.zhlh6.cn:
  ## also can use http/https source like https://github.com/
  var pkgjson = parseJson jsonStr
  for i in pkgjson:
    if i.hasKey("url"):
      var url = i["url"].getStr
      if "github.com" in url:
        var urladdr:string =  url.split("github.com/")[^1]
        if urladdr.endsWith "/":
          urladdr = urladdr[0..^2]
        # urladdr is user/repo
        urladdr = source & urladdr
        i["url"] = %* urladdr

  result = pretty pkgjson


proc getOfficalPkg(): Future[string] {.async.} =
  var client = newAsyncHttpClient()
  try:
    result = await client.getContent("https://cdn.jsdelivr.net/gh/nim-lang/packages/packages.json")
  except OSError:
    raiseAssert "please check your network"

let pkgjson = waitFor getOfficalPkg()

let f = open("packages.json",fmWrite)

when isMainModule:
  f.write convertGithub(pkgjson)