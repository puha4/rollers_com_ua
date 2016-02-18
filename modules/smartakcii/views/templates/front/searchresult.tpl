{capture name=path}
<span class="navigation-page">
	<a href="{smartakcii::GetSmartAkciiLink('smartakcii')}">{l s='Все акции' mod='smartakcii'}</a>
	{if $title_category != ''}
		<span class="navigation-pipe">{$navigationPipe}</span>{$title_category}
    {/if}
</span>    
{/capture}

{if $postcategory == ''}
	{include file="./search-not-found.tpl" postcategory=$postcategory}
{else}
	<div id="smartakciicat" class="block">
		{foreach from=$postcategory item=post}
			{include file="./category_loop.tpl" postcategory=$postcategory}
		{/foreach}
	</div>
{/if}

{if isset($smartcustomcss)}
	<style>
		{$smartcustomcss}
	</style>
{/if}

