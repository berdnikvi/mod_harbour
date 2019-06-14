function Main()

   TEMPLATE
<style>
body {
    font-family: Arial;
}

ul.tree li {
    list-style-type: none;
    position: relative;
}

ul.tree li ul {
    display: none;
}

ul.tree li.open > ul {
    display: block;
}

ul.tree li a {
    color: black;
    text-decoration: none;
}

ul.tree li a:before {
    height: 1em;
    padding:0 .1em;
    font-size: .8em;
    display: block;
    position: absolute;
    left: -1.3em;
    top: .2em;
}

ul.tree li > a:not(:last-child):before {
    content: '[ + ] ';
}

ul.tree li.open > a:not(:last-child):before {
    content: '[ - ] ';
}
</style>
<ul class="tree">
<?prg local nPart, nItem, nSubItem
      local cItems := ""
      
      for nPart = 1 to 5
         cItems += '<li><a href="#"> Part ' + AllTrim( Str( nPart ) ) + "</a>"
         cItems += '<ul>'
         for nItem = 1 to 10
            cItems += '<ul>'
            cItems += '<li><a href="#"> Item ' + AllTrim( Str( nItem ) ) + "</a>"
            for nSubItem = 1 to 5
               cItems += '<ul>'
               cItems += '<li><a href="#"> SubItem ' + AllTrim( Str( nSubItem ) ) + "</a></li>"
               cItems += '</ul>'
            next
            cItems += '</li></ul>'
         next  
         cItems += '</ul></li>'
      next
      
      return cItems ?>
</ul>

<script>
var tree = document.querySelectorAll('ul.tree a:not(:last-child)');
for(var i = 0; i < tree.length; i++){
    tree[i].addEventListener('click', function(e) {
        var parent = e.target.parentElement;
        var classList = parent.classList;
        if(classList.contains("open")) {
            classList.remove('open');
            var opensubs = parent.querySelectorAll(':scope .open');
            for(var i = 0; i < opensubs.length; i++){
                opensubs[i].classList.remove('open');
            }
        } else {
            classList.add('open');
        }
    });
}
</script>
ENDTEXT

return nil