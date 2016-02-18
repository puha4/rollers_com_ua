<div id="htmlcontent" class="panel">
	<div class="panel-heading">{l s='Add video block' mod='tmbackgroundvideo'}</div>
    <div class="new-item">
        <div class="form-group">
            <button type="button" class="btn btn-default btn-lg button-new-item"><i class="icon-plus-sign"></i> {l s='Add container' mod='tmbackgroundvideo'}</button>
        </div>
        <div class="item-container">
            <form method="post" action="" enctype="multipart/form-data" class="item-form defaultForm form-horizontal">
                <div class="well">
                    <div class="item-field form-group">
                        <label class="control-label col-lg-3">{l s='Selector' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-7">
                            <input type="text" name="item_selector" value="">
                        </div>
                    </div>
                    <div class="item-field form-group">
                        <label class="control-label col-lg-3">{l s='Video type' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-7">
                            <div class="switch prestashop-switch fixed-width-lg">   
                                <select class="form-control fixed-width-lg parallax_type" name="item_type" default="image" readonly>
                                    <option value="youtube">Youtube</option>  
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="item-field form-group">
                        <label class="control-label col-lg-3">{l s='Video ID' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-7">
                            <input type="text" name="item_href" value="">
                        </div>
                    </div>
                    <div class="item-field form-group">
                        <label class="col-lg-3 control-label">{l s='Loop' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-9">
                            <span class="switch prestashop-switch fixed-width-lg">
                                <input type="radio" name="loop" id="loop_on" value="1" {if isset($item) && $item && $item.is_mega}checked="checked"{/if}>
                                <label for="loop_on" class="radioCheck">
                                    <i class="color_success"></i> {l s='Yes' mod='tmbackgroundvideo'}
                                </label>
                                <input type="radio" name="loop" id="loop_off" value="0" {if isset($item) && $item}{if !$item.is_mega}checked="checked"{/if}{else}checked="checked"{/if}>
                                <label for="loop_off" class="radioCheck">
                                    <i class="color_danger"></i> {l s='No' mod='tmbackgroundvideo'}
                                </label>
                                <a class="slide-button btn"></a>
                            </span>
                        </div>
                    </div>
                    <div class="item-field form-group">
                        <label class="col-lg-3 control-label">{l s='Pause on scroll' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-9">
                            <span class="switch prestashop-switch fixed-width-lg">
                                <input type="radio" name="pauseos" id="pauseos_on" value="1">
                                <label for="pauseos_on" class="radioCheck">
                                    <i class="color_success"></i> {l s='Yes' mod='tmbackgroundvideo'}
                                </label>
                                <input type="radio" name="pauseos" id="pauseos_off" value="0" checked="checked">
                                <label for="pauseos_off" class="radioCheck">
                                    <i class="color_danger"></i> {l s='No' mod='tmbackgroundvideo'}
                                </label>
                                <a class="slide-button btn"></a>
                            </span>
                        </div>
                    </div>
                    <div class="item-field form-group">
                        <label class="control-label col-lg-3">{l s='Extra image' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-7">
                            <span>{$item.filename|escape:'htmlall':'UTF-8'}</span>
                            <input type="file" name="item_filename[]"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-7 col-lg-offset-3">
                            <button type="submit" name="newItem" class="button-new-item-save btn btn-success pull-right" onClick="this.form.submit();"><i class="icon-save"></i> {l s='Save' mod='tmbackgroundvideo'}</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

{if isset($items)}
<div id="htmlcontent" class="panel">
    <div class="panel-heading">{l s='Video blocks' mod='tmbackgroundvideo'}</div>
    <div class="lang-items">
        <div class="lang-content">
            {foreach from=$items item=item}                
            <div id="item-{$item.id|escape:'htmlall':'UTF-8'}" class="item well">
                <form method="post" action="{$formAction|escape:'htmlall':'UTF-8'}" class="item-form defaultForm form-horizontal" name="item_list_form" enctype="multipart/form-data">
                	<input type="hidden" name="item_id" value="{$item.id|escape:'htmlall':'UTF-8'}">
                    <div class="item-field form-group">
                        <label class="control-label col-lg-3">{l s='Selector' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-7">
                            <input type="text" name="item_selector" value="{$item.selector|escape:'htmlall':'UTF-8'}" />                               
                        </div>
                    </div>
                    <div class="item-field form-group">
                        <label class="control-label col-lg-3">{l s='Video type' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-7">
                            <div class="switch prestashop-switch fixed-width-lg">                                  
                                <select class="form-control fixed-width-lg parallax_type" name="item_type" default="" value="{$item.type|escape:'htmlall':'UTF-8'}" readonly>
                                    <option value="youtube"{if $item.type == 'youtube'} selected="selected"{/if}>Youtube</option>  
                                </select>                                    
                            </div>                       
                        </div>
                    </div>
                    <div class="item-field form-group">
                        <label class="control-label col-lg-3">{l s='Video ID' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-7">
                            <input type="text" name="item_href" value="{$item.href}" />                               
                        </div>
                    </div>
                    <div class="item-field form-group">
                        <label class="col-lg-3 control-label">{l s='Loop' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-9">
                            <span class="switch prestashop-switch fixed-width-lg">
                                <input type="radio" name="loop" id="loop_on_{$item.id}" value="1" {if isset($item) && $item && $item.loop}checked="checked"{/if}>
                                <label for="loop_on_{$item.id}" class="radioCheck">
                                    <i class="color_success"></i> {l s='Yes' mod='tmbackgroundvideo'}
                                </label>
                                <input type="radio" name="loop" id="loop_off_{$item.id}" value="0" {if isset($item) && $item}{if !$item.loop}checked="checked"{/if}{else}checked="checked"{/if}>
                                <label for="loop_off_{$item.id}" class="radioCheck">
                                    <i class="color_danger"></i> {l s='No' mod='tmbackgroundvideo'}
                                </label>
                                <a class="slide-button btn"></a>
                            </span>
                        </div>
                    </div>
                    <div class="item-field form-group">
                        <label class="col-lg-3 control-label">{l s='Pause on scroll' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-9">
                            <span class="switch prestashop-switch fixed-width-lg">
                                <input type="radio" name="pauseos" id="pauseos_on_{$item.id}" value="1" {if isset($item) && $item && $item.pause_on_scroll}checked="checked"{/if}>
                                <label for="pauseos_on_{$item.id}" class="radioCheck">
                                    <i class="color_success"></i> {l s='Yes' mod='tmbackgroundvideo'}
                                </label>
                                <input type="radio" name="pauseos" id="pauseos_off_{$item.id}" value="0" {if isset($item) && $item}{if !$item.pause_on_scroll}checked="checked"{/if}{else}checked="checked"{/if}>
                                <label for="pauseos_off_{$item.id}" class="radioCheck">
                                    <i class="color_danger"></i> {l s='No' mod='tmbackgroundvideo'}
                                </label>
                                <a class="slide-button btn"></a>
                            </span>
                        </div>
                    </div>
                    <div class="item-field form-group">
                        <label class="control-label col-lg-3">{l s='Extra image' mod='tmbackgroundvideo'}</label>
                        <div class="col-lg-7">
                        	<span>{$item.filename|escape:'htmlall':'UTF-8'}</span>
                        	<input type="file" name="item_filename[]"/>
                        </div>
                    </div>
                    <div class="form-group item_controls">
                        <div class="col-lg-7 col-lg-offset-3">                                                  
                            <button type="submit" name="updateItem" class="button-new-item-save btn btn-success" onClick="this.form.submit();"><i class="icon-save"></i> {l s='Save' mod='tmbackgroundvideo'}</button>
                            <button type="submit" name="removeItem" class="button-new-item-save btn btn-danger" onClick="this.form.submit();"><i class="icon-save"></i> {l s='Delete' mod='tmbackgroundvideo'}</button>
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
            $(this).parents('.new-item').find(".item-container").slideToggle();
        });         
    });  
    
</script>