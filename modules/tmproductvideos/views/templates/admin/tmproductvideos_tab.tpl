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

{if isset($error) && $error}
	{$error|escape:'html':'UTF-8'}
{/if}

<script type="text/javascript">
	shopCount = []
</script>
<div class="panel product-tab">
	<input type="hidden" name="submitted_tabs[]" value="ModuleTmproductvideos" />
	<h3 class="tab">{l s='Product Videos' mod='tmproductvideos'}</h3>
	{if isset($multishop_edit) && $multishop_edit}
    	<div class="alert alert-danger">
        	{l s='You cannot manage video items from a "All Shops" or a "Group Shop" context, select directly the shop you want to edit.' mod='tmproductvideos'}
        </div>
    {else}
        <div class="form-group">
            <label class="control-label col-lg-2" for="name_{$id_lang|escape:'html':'UTF-8'}">
                <span class="label-tooltip" data-toggle="tooltip" title="{l s='Enter link to video(Youtube, vimeo) hrere.' mod='tmproductvideos'}">
                    {l s='Video Link' mod='tmproductvideos'}
                </span>
            </label>
            <div class="col-lg-5">
                {include file="controllers/products/input_text_lang.tpl"
                    languages=$languages
                    input_class="updateCurrentLink"
                    input_name="video_link"
                }
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2" for="name_{$id_lang|escape:'html':'UTF-8'}">
                <span class="label-tooltip" data-toggle="tooltip" title="{l s='Enter link to video(Youtube, vimeo) hrere.' mod='tmproductvideos'}">
                    {l s='Video Heading' mod='tmproductvideos'}
                </span>
            </label>
            <div class="col-lg-5">
                {include file="controllers/products/input_text_lang.tpl"
                    languages=$languages
                    input_class="updateCurrentLink"
                    input_name="video_name"
                }
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2" for="video_description_{$id_lang|escape:'html':'UTF-8'}">
                <span class="label-tooltip" data-toggle="tooltip"
                    title="{l s='Videos description.' mod='tmproductvideos'}">
                    {l s='Videos Description' mod='tmproductvideos'}
                </span>
            </label>
            <div class="col-lg-9">
                {include
                    file="controllers/products/textarea_lang.tpl"
                    languages=$languages 
                    input_name='video_description'
                    class="autoload_rte_custom"
                }
            </div>
        </div>
        {foreach from=$video key=index item=videos name=video}
	       	<div class="translatable-field lang-{$index|escape:'html':'UTF-8'}">
            	<script type="text/javascript">shopCount.push({$index|escape:'html':'UTF-8'})</script>
            	<div class="row">
                	<div class="col-lg-12">
                    	<h3 class="tab">{l s='Video List' mod='tmproductvideos'}</h3>
                        <ul id="video-list-{$index|escape:'html':'UTF-8'}" class="video-list">
                            {foreach from=$videos item=v name=new_video}
                            	<li id="video_{$v.id_video|escape:'html':'UTF-8'}" class="video-item">
                                	<div class="row">
                                    	<h4 class="item-tile">
                                            {if $v.video_name}
                                                {$v.video_name|escape:'html':'UTF-8'}
                                            {/if}
                                        </h4>
                                        <div class="col-lg-3">
                                        	<span class="sort-order hidden">{$v.sort_order|escape:'html':'UTF-8'}</span>
                                            {if $v.video_type == 'youtube'}
                                            	<div class="video-preview">
                                                 	<iframe type="text/html" width="250" height="200" frameborder="0" src="{$v.video_link|escape:'html':'UTF-8'}?enablejsapi=1&version=3&html5=1&showinfo=0&autoplay=0&controls=0"></iframe>
                                                    <div class="preview-video">
                                                        <a class="fancybox-media fancybox.iframe" onclick="return false;" href="{$v.video_link|escape:'html':'UTF-8'}?autoplay=1?html5=1"><i class="icon-search-plus"></i></a>
                                                    </div>
                                                </div>
                                            {/if}
                                            {if $v.video_type == 'vimeo'}
                                            	<div class="video-preview">
                                                    <iframe 
                                                        src="{$v.video_link|escape:'html':'UTF-8'}"
                                                        width="250"
                                                        height="200"
                                                        frameborder="0"
                                                        webkitAllowFullScreen
                                                        mozallowfullscreen
                                                        allowFullScreen>
                                                    </iframe>
                                                </div>
                                            	<a class="fancybox-media fancybox.iframe" href="{$v.video_link|escape:'html':'UTF-8'}"><i class="icon-search-plus"></i></a>
                                            {/if}
                                        </div>
                                        <div class="col-lg-7">
                                        	<div class="form-group">
                                        		<input type="text" name="video_name" value="{if $v.video_name}{$v.video_name|escape:'html':'UTF-8'}{/if}"  autocomplete="off" />
                                            </div>
                                            <div class="form-group">
                                            	<textarea class="autoload_rte_custom" name="video_description" autocomplete="off">{if $v.video_description}{$v.video_description|escape:'html':'UTF-8'}{/if}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 controls">
                                        	<div class="status">
                                                <button type="submit" class="list-action-enable{if $v.status} action-enabled{else} action-disabled{/if}" name="updateStatus">
                                                    {if $v.status}
                                                        <i class="icon-check"></i>
                                                    {else}
                                                        <i class="icon-remove"></i>
                                                    {/if}
                                                </button>
                                            </div>
                                        	<button type="submit" class="btn btn-default btn-save" name="updateItem"><i class="icon-save"></i> {l s='Update video' mod='tmproductvideos'}</button>
                                            <button type="submit" class="btn btn-default btn-remove" name="removeItem"><i class="icon-trash"></i> {l s='Remove video' mod='tmproductvideos'}</button>
                                        </div>
                                        <input type="hidden" name="id_lang" value="{$v.id_lang|escape:'html':'UTF-8'}" />
                                        <input type="hidden" name="item_status" value="{$v.status|escape:'html':'UTF-8'}" />
                                        <input type="hidden" name="id_video" value="{$v.id_video|escape:'html':'UTF-8'}" />
                                    </div>
                                </li>
                            {/foreach}
                        </ul>
                	</div>
                </div>
           </div>
        {/foreach}
        <div class="panel-footer">
            <a href="{$link->getAdminLink('AdminProducts')|escape:'html':'UTF-8'}" class="btn btn-default"><i class="process-icon-cancel"></i> {l s='Cancel' mod='tmproductvideos'}</a>
            <button type="submit" name="submitAddproduct" class="btn btn-default pull-right" {if $higher_ver}disabled="disabled"{/if}>{if $higher_ver}<i class="process-icon-loading"></i>{else}<i class="process-icon-save"></i>{/if} {l s='Save' mod='tmproductvideos'}</button>
            <button type="submit" name="submitAddproductAndStay" class="btn btn-default pull-right" {if $higher_ver}disabled="disabled"{/if}>{if $higher_ver}<i class="process-icon-loading"></i>{else}<i class="process-icon-save"></i>{/if} {l s='Save and stay' mod='tmproductvideos'}</button>
        </div>
    {/if}
</div>

<script type="text/javascript">
	theme_url='{$theme_url|escape:"javascript":"UTF-8"}';
	hideOtherLanguage({$default_language.id_lang|escape:"javascript":"UTF-8"});
</script>