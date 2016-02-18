{*
* 2002-2015 TemplateMonster
*
* TemplateMonster Product Videos
*
* NOTICE OF LICENSE
*
* This source file is subject to the General Public License (GPL 2.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/GPL-2.0
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade the module to newer
* versions in the future.
*
* @author     TemplateMonster (Alexander Grosul)
* @copyright  2002-2015 TemplateMonster
* @license    http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*}

{if isset($videos) && $videos}
	<div id="product-video-tab-content" class="product-video-tab-content tab-pane">
        {foreach from=$videos item=video name=myvideo}
            {if $video.type == 'youtube'}
                <div class="videowrapper">
                    <iframe type="text/html" 
                        src="{$video.link|escape:'html':'UTF-8'}?enablejsapi=1&version=3&html5=1&wmode=transparent"
                        frameborder="0"
                        wmode="Opaque"></iframe>
                </div>
           {elseif $video.type == 'vimeo'}
                <div class='embed-container'>
                    <iframe 
                        src="{$video.link|escape:'html':'UTF-8'}"
                        frameborder="0"
                        webkitAllowFullScreen
                        mozallowfullscreen
                        allowFullScreen>
                    </iframe>
                </div>
            {/if}
            {if $video.name}
                <h4 class="video-name">{$video.name|escape:'html':'UTF-8'}</h4>
            {/if}
            {if $video.description}
                <p class="video-description">{$video.description}</p>
            {/if}
        {/foreach}
    </div>
{/if}