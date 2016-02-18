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
    <section id="product-videos" class="page-product-box">
        <h3 class="page-product-heading">{if count($videos) > 1}{l s='Videos' mod='tmproductvideos'}{else}{l s='Video' mod='tmproductvideos'}{/if}</h3>
        {foreach from=$videos item=video name=myvideo}
        	{if $video.type == 'youtube'}
            	<div class="videowrapper">
                	<iframe type="text/html" 
                    	src="{$video.link|escape:'html':'UTF-8'}?enablejsapi=1&version=3&html5=1"
                    	frameborder="0"></iframe>
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
    </section>
{/if}