{*
* 2002-2015 TemplateMonster
*
* TemplateMonster Newsletter
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

{strip}
	{addJsDef is_logged = $is_logged}
	{addJsDef blocking_popup = $blocking_popup|escape:'quotes':'UTF-8'}
    {addJsDef user_newsletter_status = $user_newsletter_status|escape:'intval'}
    {addJsDef popup_status = $popup_status|escape:'intval'}
    {addJsDef module_url = $module_url|escape:'html'}
    {addJsDef text_description = $content|escape:'quotes':'UTF-8'}
    {addJsDef text_heading = $title|escape:'html':'UTF-8'}

    {addJsDefL name=text_close}{l s='Close' mod='tmnewsletter'}{/addJsDefL}
    {addJsDefL name=text_sign}{l s='Subscribe' mod='tmnewsletter'}{/addJsDefL}
    {addJsDefL name=text_email}{l s='Your E-Mail' mod='tmnewsletter'}{/addJsDefL}
    {addJsDefL name=text_heading_2}{l s='Success' mod='tmnewsletter'}{/addJsDefL}
    {addJsDefL name=text_heading_3}{l s='Error' mod='tmnewsletter'}{/addJsDefL}
    {addJsDefL name=text_remove}{l s='Do not show again' mod='tmnewsletter'}{/addJsDefL}
    {addJsDefL name=text_placeholder}{l s='Enter your e-mail'  mod='tmnewsletter'}{/addJsDefL}
{/strip}