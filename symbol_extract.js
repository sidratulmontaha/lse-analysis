elm = $x("//a[@class='linkTabs']");
var out = "";
re = /\(([^)]+)\)/;
elm.forEach(function(e){
    out += "LON:" + e.innerText.match(re)[1] + "," + e.innerText.replace(e.innerText.match(re)[0], "").trim() + '\n';
})