!function(){for(var e=document.body.getElementsByTagName("a"),t=e.length,n=0;n<t;n++) if (new URL(e[n].href).origin!==location.origin) {
    e[n].setAttribute("target","_blank"); 
    e[n].setAttribute("rel","noopener noreferrer");
    var o=e[n].innerHTML;
    e[n].innerHTML=o+' <i class="fas fa-external-link-alt"></i>'
}}();