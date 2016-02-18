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
<div id="htmlcontent" class="panel">
	<div class="panel-heading">{l s='Add new block' mod='tmmediaparallax'}</div>
    <div class="new-item">
        <div class="form-group">
            <button type="button" class="btn btn-default btn-lg button-new-item"><i class="icon-plus-sign"></i> {l s='Add container' mod='tmmediaparallax'}</button>
        </div>
        <div class="item-container">
            <form method="post" action="" enctype="multipart/form-data" class="item-form defaultForm form-horizontal">
                <div class="well">
                    <div class="selector item-field form-group">
                        <label class="control-label col-lg-3">{l s='Selector' mod='tmmediaparallax'}</label>
                        <div class="col-lg-7">
                            <input type="text" name="item_selector" value="#header">
                        </div>
                    </div>
                    <div class="type item-field form-group">
                        <label class="control-label col-lg-3">{l s='Parallax type' mod='tmmediaparallax'}</label>
                        <div class="col-lg-7">
                            <div class="switch prestashop-switch fixed-width-lg">   
                                <select class="form-control fixed-width-lg parallax_type" name="item_type" default="image">
                                    <option value="image">image</option>  
                                    <option value="video">video</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="media item-field form-group">
                        <label class="control-label col-lg-3">{l s='Media files' mod='tmmediaparallax'}</label>
                        <div class="col-lg-7">
                            <input type="file" name="item_filename[]" multiple/>
                            <span>{l s='For video parallax please make sure to upload video in three formats .mp4, .webm and .ogv. Image poster can be .png, .jpg or .gif.' mod='tmmediaparallax'}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-7 col-lg-offset-3">
                            <button type="submit" name="newItem" class="button-new-item-save btn btn-success pull-right" onClick="this.form.submit();"><i class="icon-save"></i> {l s='Save' mod='tmmediaparallax'}</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

{if isset($parallaxitems)}
<div id="htmlcontent" class="panel">
	<div class="panel-heading">{l s='Parallax blocks' mod='tmmediaparallax'}</div>
    <div class="lang-items">
        <div class="lang-content">
        {foreach from=$parallaxitems item=item}                
            <div id="item-{$item.id|escape:'htmlall':'UTF-8'}" class="item well">
                <form method="post" action="{$formAction|escape:'htmlall':'UTF-8'}" class="item-form defaultForm form-horizontal" name="item_list_form" enctype="multipart/form-data">
                	<input type="hidden" name="item_id" value="{$item.id|escape:'htmlall':'UTF-8'}">
                    <div class="selector item-field form-group">
                    	<label class="control-label col-lg-3">{l s='Selector' mod='tmmediaparallax'}</label>
                        <div class="col-lg-7">
                            <input type="text" name="item_selector" value="{$item.selector|escape:'htmlall':'UTF-8'}" />                               
                        </div>
                    </div>
                    <div class="type item-field form-group">
                        <label class="control-label col-lg-3">{l s='Parallax type' mod='tmmediaparallax'}</label>
                        <div class="col-lg-7">
                            <div class="switch prestashop-switch fixed-width-lg">                                  
                                <select class="form-control fixed-width-lg parallax_type" name="item_type" default="" value="{$item.type|escape:'htmlall':'UTF-8'}">
                                    <option value="image"{if $item.type == 'image'} selected="selected"{/if}>image</option>  
                                    <option value="video"{if $item.type == 'video'} selected="selected"{/if}>video</option>
                                </select>                                    
                            </div>                       
                        </div>
                    </div>
                
                    <div class="media item-field form-group">
                        <label class="control-label col-lg-3">{l s='Media files' mod='tmmediaparallax'}</label>
                        <div class="col-lg-7">
                        	<span>{$item.filename|escape:'htmlall':'UTF-8'}</span>
                        	<input type="file" name="item_filename[]" multiple />
                        	<span>{l s='For video parallax please make sure to upload video in three formats .mp4, .webm and .ogv. Image poster can be .png, .jpg or .gif.' mod='tmmediaparallax'}</span>
                        </div>
                    </div>
                    <div class="form-group item_controls">
                        <div class="col-lg-7 col-lg-offset-3">                                                  
                        	<button type="submit" name="updateItem" class="button-new-item-save btn btn-success" onClick="this.form.submit();"><i class="icon-save"></i> {l s='Save' mod='tmmediaparallax'}</button>
							<button type="submit" name="removeItem" class="button-new-item-save btn btn-danger" onClick="this.form.submit();"><i class="icon-save"></i> {l s='Delete' mod='tmmediaparallax'}</button>
                        </div>
                    </div>
                </form>
            </div>  
        {/foreach}
        </div>
    </div>
</div>
{/if}


<style>
    .item-container{
        display: none;
    }
    .item_controls button{
        float: right;
        margin-left: 4px;
    }

}
</style>

<script>
    jQuery(document).ready(function() {

        //show new item panel
        $('.button-new-item').on('click', function() {
            $('.new-item').find('.item-container').slideToggle();
        });         
    });  
    
</script>
