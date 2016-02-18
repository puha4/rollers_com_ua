{*
* 2002-2015 TemplateMonster
*
* Media parallax module
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
* @author     TemplateMonster (Alexey Svistunov)
* @copyright  2002-2015 TemplateMonster
* @license    http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*}

{addJsDef scroll_step=$smooth_scroll_step|intval}
{addJsDef scrool_speed=$smooth_scroll_speed|intval}

{if $smooth_scroll_on == 1}
	<script type="text/javascript">
		$(document).ready(function() {
			if(!device.mobile() && !device.tablet()){
				$.srSmoothscroll({
					step: scroll_step,
					speed: scrool_speed
				});
			}
		});
	</script>
{/if}

<script type="text/javascript">
	function addVideoParallax(selector, path, filename)
	{
		var selector = $(selector);

		selector.addClass('parallax_section');
		selector.attr('data-type-media', 'video_html');
		selector.attr('data-mp4', 'true');
		selector.attr('data-webm', 'true');
		selector.attr('data-ogv', 'true');
		selector.attr('data-poster', 'true');
		selector.wrapInner('<div class="container parallax_content"></div>');
		selector.append('<div class="parallax_inner"><video class="parallax_media" width="100%" height="100%" autoplay loop poster="{$base_path|escape:"htmlall":"UTF-8"}'+path+filename+'.jpg"><source src="{$base_path|escape:"htmlall":"UTF-8"}'+path+filename+'.mp4" type="video/mp4"><source src="{$base_path|escape:"htmlall":"UTF-8"}'+path+filename+'.webdm" type="video/webm"><source src="{$base_path|escape:"htmlall":"UTF-8"}'+path+filename+'.ogv" type="video/ogg"></video></div>');

		selector.tmMediaParallax();
	}
	
	function addImageParallax(selector, path, filename, width, height)
	{
		var selector = $(selector);

		selector.addClass('parallax_section');
		selector.attr('data-type-media', 'image');
		selector.wrapInner('<div class="container parallax_content"></div>');
		selector.append('<div class="parallax_inner"><img class="parallax_media" src="{$base_path|escape:"htmlall":"UTF-8"}'+path+filename+'" data-base-width="'+width+'" data-base-height="'+height+'"/></div>');

		selector.tmMediaParallax();
	}

	$(window).load(function(){
		{foreach from=$parallaxitems item=item}
			{if $item.type == 'image'}
				addImageParallax('{$item.selector|escape:"htmlall":"UTF-8"}','{$media_path|escape:"htmlall":"UTF-8"}','{$item.filename|escape:"htmlall":"UTF-8"}','{$item.width|escape:"htmlall":"UTF-8"}','{$item.height|escape:"htmlall":"UTF-8"}');
			{/if}
			{if $item.type == 'video'}
				addVideoParallax('{$item.selector|escape:"htmlall":"UTF-8"}','{$media_path|escape:"htmlall":"UTF-8"}','{$item.filename|escape:"htmlall":"UTF-8"}');
			{/if}
		{/foreach}
	});
</script>
