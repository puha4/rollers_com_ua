{if isset($items)}
    <script type="text/javascript">
        $(document).ready(function(){
                {foreach from=$items item=item} 
                    $(window).on("load resize",function(){
                        $('{$item.selector}').css("width",$(document).width()).css("margin-left","-"+($(document).width()/2)+"px")
                    });
                    $('{$item.selector}').wrapInner("<div class='bg-video-content container'>");
                    $('{$item.selector}').append("<div class='bg-video-container'>");
                    $('{$item.selector}').css('position','relative').css('overflow','hidden').css("left","50%").css("width",$(document).width()).css("margin-left","-"+($(document).width()/2)+"px");
            
                    $('{$item.selector}>*').css('z-index','1').css('position','relative');
                    if(!isMobile){
                        $('{$item.selector} .bg-video-container').YTPlayer({
                            fitToBackground: true,
                            videoId: '{$item.href}',
                            pauseOnScroll: {if $item.pause_on_scroll == 1}true{else}false{/if},
                            repeat: {if $item.loop == 1}true{else}false{/if}
                        });
                    } else {
                        $('{$item.selector}').css('background','url({$media_path|escape:"htmlall":"UTF-8"}{$item.imgname|escape:"htmlall":"UTF-8"})');
                    }
                {/foreach}
        });
    </script>
{/if}
