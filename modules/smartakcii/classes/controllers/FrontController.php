<?php

class smartakciiModuleFrontController extends ModuleFrontController
{
	public function initContent()
	{
	    parent::initContent();
            if($id_category = Tools::getvalue('id_category') && Tools::getvalue('id_category') != Null){
                 $this->context->smarty->assign(AkciiCategory::GetMetaByCategory(Tools::getvalue('id_category')));
            }
            if($id_post = Tools::getvalue('id_post')  && Tools::getvalue('id_post') != Null){
                 $this->context->smarty->assign(SmartAkciiPost::GetPostMetaByPost(Tools::getvalue('id_post')));
            }
            if(Tools::getvalue('id_category') == Null  && Tools::getvalue('id_post') == Null){
              $meta['meta_title'] = Configuration::get('smartakciimetatitle');
              $meta['meta_description'] = Configuration::get('smartakciimetadescrip');
              $meta['meta_keywords'] = Configuration::get('smartakciimetakeyword');
              $this->context->smarty->assign($meta);
            }
              if(Configuration::get('smartakciishowcolumn') == 0){
                  $this->context->smarty->assign(array(
			    'HOOK_LEFT_COLUMN' => Hook::exec('displaySmartAkciiLeft'),
			    'HOOK_RIGHT_COLUMN' => Hook::exec('displaySmartAkciiRight')
			));
              }elseif(Configuration::get('smartakciishowcolumn') == 1){
                  $this->context->smarty->assign(array(
			    'HOOK_LEFT_COLUMN' => Hook::exec('displaySmartAkciiLeft')
			)); 
              }elseif(Configuration::get('smartakciishowcolumn') == 2){

                   $this->context->smarty->assign(array(
			    'HOOK_RIGHT_COLUMN' => Hook::exec('displaySmartAkciiRight')
			));
              }elseif(Configuration::get('smartakciishowcolumn') == 3){
                  $this->context->smarty->assign(array());
              }else{
                  $this->context->smarty->assign(array(
			    'HOOK_LEFT_COLUMN' => Hook::exec('displaySmartAkciiLeft'),
			    'HOOK_RIGHT_COLUMN' => Hook::exec('displaySmartAkciiRight')
			));   
              } 
        }
}