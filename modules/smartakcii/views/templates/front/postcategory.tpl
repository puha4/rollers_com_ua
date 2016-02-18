	{capture name=path}<span class="navigation-page"><a href="{smartakcii::GetSmartAkciiLink('smartakcii')}">{l s='Все акции' mod='smartakcii'}</a>
    {if $title_category != ''}<span class="navigation-pipe">{$navigationPipe}</span>{$title_category}{/if}</span>{/capture}
    
    {if $title_category != ''}<h1 class="page-heading">{$title_category}</h1>{/if}
    
    {if $postcategory == ''}
        {if $title_category != ''}
             <p class="alert alert-warning">{l s='No Post in Category' mod='smartakcii'}</p>
        {else}
             <p class="alert alert-warning">{l s='No Post in Akcii' mod='smartakcii'}</p>
        {/if}
    {else}
		{if $smartdisablecatimg == '1'}
        	{assign var="activeimgincat" value='0'}
            {$activeimgincat = $smartshownoimg} 
        	{if $title_category != ''}        
				{foreach from=$categoryinfo item=category}
            		<div id="sdsakciiCategory" class="clearfix">
               			{if ($cat_image != "no" && $activeimgincat == 0) || $activeimgincat == 1}
                   			<img alt="{$category.meta_title}" src="{$modules_dir}/smartakcii/images/category/{$cat_image}-home-default.jpg" class="imageFeatured">
               			{/if}
                		{$category.description}
            		</div>
				{/foreach}  
			{/if}
		{/if}

        <div id="smartakciicat" class="block">
            {foreach from=$postcategory item=post}
                {include file="./category_loop.tpl" postcategory=$postcategory}
            {/foreach}
        </div>
    
        {if !empty($pagenums)}
            <div class="bottom-pagination-content clearfix">
            	<ul class="pagination pull-right">
                    {for $k=0 to $pagenums}
                        {if $title_category != ''}
                            {assign var="options" value=null}
                            {$options.page = $k+1}
                            {$options.id_category = $id_category}
                            {$options.slug = $cat_link_rewrite}
                        {else}
                            {assign var="options" value=null}
                            {$options.page = $k+1}
                        {/if}
                        {if ($k+1) == $c}
                            <li class="active"><span class="page-active">{$k+1}</span></li>
                        {else}
                            {if $title_category != ''}
                                <li><a class="page-link" href="{smartakcii::GetSmartAkciiLink('smartakcii_category_pagination',$options)}">{$k+1}</a></li>
                            {else}
                                <li><a class="page-link" href="{smartakcii::GetSmartAkciiLink('smartakcii_list_pagination',$options)}">{$k+1}</a></li>
                            {/if}
                        {/if}
                    {/for}
                </ul>
                <div class="post-count">{l s="Showing" mod="smartakcii"} {if $limit_start!=0}{$limit_start}{else}1{/if} {l s="to" mod="smartlatestnews"} {if $limit_start+$limit >= $total}{$total}{else}{$limit_start+$limit}{/if} {l s="of" mod="smartakcii"} {$total} ({$c} {l s="Pages" mod="smartakcii"})</div>
            </div>
        {/if}
    {/if}
    
    {if isset($smartcustomcss)}
        <style>
            {$smartcustomcss}
        </style>
    {/if}