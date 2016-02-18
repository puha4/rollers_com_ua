<?php
class AdminAkciiPostController extends AdminController {

    public $asso_type = 'shop';

    public function __construct() {
        $this->table = 'smart_akcii_post';
        $this->className = 'SmartAkciiPost';
        $this->lang = true;
        $this->image_dir = '../modules/smartakcii/images';
        $this->context = Context::getContext();
        $this->_defaultOrderBy = 'created';
        $this->_defaultorderWay = 'DESC';
        $this->bootstrap = true;
            if (Shop::isFeatureActive())
                 Shop::addTableAssociation($this->table, array('type' => 'shop'));
		parent::__construct();
        $this->fields_list = array(
                            'id_smart_akcii_post' => array(
                                    'title' => $this->l('Id'),
                                    'width' => 50,
                                    'type' => 'text',
                                    'orderby' => true,
                                    'filter' => true,
                                    'search' => true
                            ),
                'viewed' => array(
                                    'title' => $this->l('View'),
                                    'width' => 50,
                                    'type' => 'text',
                                    'lang' => true,
                                    'orderby' => true,
                                    'filter' => false,
                                    'search' => false
                            ),
                             'image' => array(
                                    'title' => $this->l('Image'),
                                    'image' => $this->image_dir,
                                    'orderby' => false,
                                    'search' => false,
                                    'width' => 200,
                                    'align' => 'center',
                                    'orderby' => false,
                                    'filter' => false,
                                    'search' => false
                               ),
                            'meta_title' => array(
                                    'title' => $this->l('Title'),
                                    'width' => 440,
                                    'type' => 'text',
                                    'lang' => true,
                                    'orderby' => true,
                                    'filter' => true,
                                    'search' => true
                            ),
                            'created' => array(
                                    'title' => $this->l('Posted Date'),
                                    'width' => 100,
                                    'type' => 'date',
                                    'lang' => true,
                                    'orderby' => true,
                                    'filter' => true,
                                    'search' => true
                            ),
                            'active' => array(
                                'title' => $this->l('Status'),
                                'width' => '70',
                                'align' => 'center',
                                'active' => 'status',
                                'type' => 'bool',
                                'orderby' => true,
                                'filter' => true,
                                'search' => true
                            )
                    );
        $this->_join = 'LEFT JOIN '._DB_PREFIX_.'smart_akcii_post_shop sbs ON a.id_smart_akcii_post=sbs.id_smart_akcii_post && sbs.id_shop IN('.implode(',',Shop::getContextListShopID()).')';
        $this->_select = 'sbs.id_shop';
        $this->_defaultOrderBy = 'a.id_smart_akcii_post';
        $this->_defaultOrderWay = 'DESC';
        if (Shop::isFeatureActive() && Shop::getContext() != Shop::CONTEXT_SHOP)
        {
           $this->_group = 'GROUP BY a.smart_akcii_post';
        }
        parent::__construct();
    }
    public function renderList() {
        $this->addRowAction('edit');
        $this->addRowAction('delete');
        return parent::renderList();
    }
    public function postProcess()
    {
        $SmartAkciiPost = new SmartAkciiPost();
        $AkciiPostCategory = new AkciiPostCategory();
        
        if (Tools::isSubmit('deletesmart_akcii_post') && Tools::getValue('id_smart_akcii_post') != '')
        {
            $SmartAkciiPost = new SmartAkciiPost((int) Tools::getValue('id_smart_akcii_post'));
            
            if (!$SmartAkciiPost->delete()){
                $this->errors[] = Tools::displayError('An error occurred while deleting the object.')
                        . ' <b>' . $this->table . ' (' . Db::getInstance()->getMsgError() . ')</b>';
            }else{
                Hook::exec('actionsbdeletepost', array('SmartAkciiPost' => $SmartAkciiPost));
                Tools::redirectAdmin($this->context->link->getAdminLink('AdminAkciiPost'));
            }
        }elseif (Tools::isSubmit('submitAddsmart_akcii_post'))
        {
            parent::validateRules();
            if (count($this->errors))
                return false;
             if (!$id_smart_akcii_post = (int) Tools::getValue('id_smart_akcii_post')) {
                $SmartAkciiPost = new $SmartAkciiPost();
                $id_lang_default = Configuration::get('PS_LANG_DEFAULT');
                        $languages = Language::getLanguages(false);
			foreach ($languages as $language){
				$title = str_replace('"','',htmlspecialchars_decode(html_entity_decode(Tools::getValue('meta_title_'.$language['id_lang']))));
				$SmartAkciiPost->meta_title[$language['id_lang']] = $title;
				$SmartAkciiPost->meta_keyword[$language['id_lang']] = (string)Tools::getValue('meta_keyword_'.$language['id_lang']);
				$SmartAkciiPost->meta_description[$language['id_lang']] = Tools::getValue('meta_description_'.$language['id_lang']);
				$SmartAkciiPost->short_description[$language['id_lang']] = (string)Tools::getValue('short_description_'.$language['id_lang']);
				$SmartAkciiPost->content[$language['id_lang']] = Tools::getValue('content_'.$language['id_lang']);
                                if(Tools::getValue('link_rewrite_'.$language['id_lang'])=='' && Tools::getValue('link_rewrite_'.$language['id_lang']) == null){
                                    $SmartAkciiPost->link_rewrite[$language['id_lang']] = str_replace(array(' ',':', '\\', '/', '#', '!','*','.','?'),'-',Tools::getValue('meta_title_'.$id_lang_default));
                                }else{
                                    $SmartAkciiPost->link_rewrite[$language['id_lang']] = str_replace(array(' ',':', '\\', '/', '#', '!','*','.','?'),'-',Tools::getValue('link_rewrite_'.$language['id_lang']));
                                }
                        }
                        $SmartAkciiPost->id_parent = Tools::getValue('id_parent');   
                        $SmartAkciiPost->position = 0;
                        $SmartAkciiPost->active = Tools::getValue('active');
                        
                        $SmartAkciiPost->id_category = Tools::getValue('id_category');
                        $SmartAkciiPost->comment_status = Tools::getValue('comment_status');
                        $SmartAkciiPost->id_author = $this->context->employee->id;
                        $SmartAkciiPost->created = Date('y-m-d H:i:s');
                        $SmartAkciiPost->modified = Date('y-m-d H:i:s');
                        $SmartAkciiPost->available = 1;
                        $SmartAkciiPost->is_featured = Tools::getValue('is_featured');
                        $SmartAkciiPost->viewed = 1;
               
                
                        $SmartAkciiPost->post_type = Tools::getValue('post_type');
                          
			if (!$SmartAkciiPost->save())
				$this->errors[] = Tools::displayError('An error has occurred: Can\'t save the current object');
			else{
                Hook::exec('actionsbnewpost', array('SmartAkciiPost' => $SmartAkciiPost));
                            $this->updateTags($languages, $SmartAkciiPost);
                            $this->processImage($_FILES,$SmartAkciiPost->id);
			  Tools::redirectAdmin($this->context->link->getAdminLink('AdminAkciiPost'));
                         }
            }elseif($id_smart_akcii_post = Tools::getValue('id_smart_akcii_post')) {

                $SmartAkciiPost = new $SmartAkciiPost($id_smart_akcii_post);
                $languages = Language::getLanguages(false);
			foreach ($languages as $language){
                $title = str_replace('"','',htmlspecialchars_decode(html_entity_decode(Tools::getValue('meta_title_'.$language['id_lang']))));
				$SmartAkciiPost->meta_title[$language['id_lang']] = $title;
				$SmartAkciiPost->meta_keyword[$language['id_lang']] = Tools::getValue('meta_keyword_'.$language['id_lang']);
				$SmartAkciiPost->meta_description[$language['id_lang']] = Tools::getValue('meta_description_'.$language['id_lang']);
				$SmartAkciiPost->short_description[$language['id_lang']] = Tools::getValue('short_description_'.$language['id_lang']);
				$SmartAkciiPost->content[$language['id_lang']] = Tools::getValue('content_'.$language['id_lang']);
				$SmartAkciiPost->link_rewrite[$language['id_lang']] = str_replace(array(' ',':', '\\', '/', '#', '!','*','.','?'),'-',Tools::getValue('link_rewrite_'.$language['id_lang']));
                        }
                        $SmartAkciiPost->is_featured = Tools::getValue('is_featured');
                        $SmartAkciiPost->id_parent = Tools::getValue('id_parent');
                        $SmartAkciiPost->active = Tools::getValue('active');
                        $SmartAkciiPost->id_category = Tools::getValue('id_category');
                        $SmartAkciiPost->comment_status = Tools::getValue('comment_status');
                        $SmartAkciiPost->id_author = $this->context->employee->id;
                        $SmartAkciiPost->modified = Date('y-m-d H:i:s');
                if (!$SmartAkciiPost->update())
                    $this->errors[] = Tools::displayError('An error occurred while updating an object.')
                            . ' <b>' . $this->table . ' (' . Db::getInstance()->getMsgError() . ')</b>';
                else
                  Hook::exec('actionsbupdatepost', array('SmartAkciiPost' => $SmartAkciiPost));
                    $this->updateTags($languages, $SmartAkciiPost);
                    $this->processImage($_FILES,$SmartAkciiPost->id_smart_akcii_post);
                    Tools::redirectAdmin($this->context->link->getAdminLink('AdminAkciiPost'));
            }
        }elseif (Tools::isSubmit('statussmart_akcii_post') && Tools::getValue($this->identifier)) {

            if ($this->tabAccess['edit'] === '1') {
                if (Validate::isLoadedObject($object = $this->loadObject())) {
                    if ($object->toggleStatus()) {
                        Hook::exec('actionsbtogglepost', array('SmartAkciiPost' => $this->object));
                        $identifier = ((int) $object->id_parent ? '&id_smart_akcii_post=' . (int) $object->id_parent : '');
                        Tools::redirectAdmin($this->context->link->getAdminLink('AdminAkciiPost'));
                    } else
                        $this->errors[] = Tools::displayError('An error occurred while updating the status.');
                } else
                    $this->errors[] = Tools::displayError('An error occurred while updating the status for an object.')
                            . ' <b>' . $this->table . '</b> ' . Tools::displayError('(cannot load object)');
            }else
                $this->errors[] = Tools::displayError('You do not have permission to edit this.');
        }elseif(Tools::isSubmit('smart_akcii_postOrderby')&& Tools::isSubmit('smart_akcii_postOrderway'))
        {
            $this->_defaultOrderBy = Tools::getValue('smart_akcii_postOrderby');
            $this->_defaultOrderWay = Tools::getValue('smart_akcii_postOrderway');
        }
    }

    public function processImage($FILES,$id) {
 
            if (isset($FILES['image']) && isset($FILES['image']['tmp_name']) && !empty($FILES['image']['tmp_name'])) {
                if ($error = ImageManager::validateUpload($FILES['image'], 4000000))
                    return $this->displayError($this->l('Invalid image'));
                else {
                    $ext = substr($FILES['image']['name'], strrpos($FILES['image']['name'], '.') + 1);
                    $file_name = $id . '.' . $ext;


                    $path = _PS_MODULE_DIR_ .'smartakcii/images/' . $file_name;
                  

                    if (!move_uploaded_file($FILES['image']['tmp_name'], $path))
                        return $this->displayError($this->l('An error occurred while attempting to upload the file.'));
                    else {
                        $posts_types = AkciiImageType::GetImageAllType('post');
                        foreach ($posts_types as  $image_type)
			{
                                     $dir = _PS_MODULE_DIR_ .'smartakcii/images/'.$id.'-'.stripslashes($image_type['type_name']).'.jpg';
                                        if (file_exists($dir))
						unlink($dir);
			}
			foreach ($posts_types as $image_type)
			{
                                    ImageManager::resize($path,_PS_MODULE_DIR_ .'smartakcii/images/'.$id.'-'.stripslashes($image_type['type_name']).'.jpg',
                                        (int)$image_type['width'], (int)$image_type['height']
                                        );
			}
                    }
                }
            }
    }
    
    public function renderForm() 
     {
      $img_desc = '';
        $img_desc .= $this->l('Upload a Feature Image from your computer.<br/>N.B : Only jpg image is allowed');
        if(Tools::getvalue('id_smart_akcii_post') != '' && Tools::getvalue('id_smart_akcii_post') != NULL){
             $img_desc .= '<br/><img style="height:auto;width:300px;clear:both;border:1px solid black;" alt="" src="'.__PS_BASE_URI__.'modules/smartakcii/images/'.Tools::getvalue('id_smart_akcii_post').'.jpg" /><br />';
        }
        $this->fields_form = array(
          'legend' => array(
          'title' => $this->l('Akcii Post'),
            ),
            'input' => array(
                array(
                    'type' => 'hidden',
                    'name' => 'post_type',
                    'default_value' => 0,
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Akcii Title'),
                    'name' => 'meta_title',
                    'size' => 60,
                    'required' => true,
                    'desc' => $this->l('Enter Your Akcii Post Title'),
                    'lang' => true,
                ),
                array(
                    'type' => 'textarea',
                    'label' => $this->l('Description'),
                    'name' => 'content',
                    'lang' => true,
                    'rows' => 10,
                    'cols' => 62,
                    'class' => 'rte',
                    'autoload_rte' => true,
                    'required' => true,
                    'desc' => $this->l('Enter Your Post Description')
                ),
                array(
                    'type' => 'file',
                    'label' => $this->l('Feature Image:'),
                    'name' => 'image',
                    'display_image' => false,
                    'desc' => $img_desc
                ),
                array(
					'type' => 'select',
					'label' => $this->l('Akcii Category'),
					'name' => 'id_category',
					'options' => array(
						'query' =>AkciiCategory::getCategory(),
						'id' => 'id_smart_akcii_category',
						'name' => 'meta_title'
					),
					'desc' => $this->l('Select Your Parent Category')
                      ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Meta Keyword'),
                    'name' => 'meta_keyword',
                    'lang' => true,
                    'size' => 60,
                    'required' => false,
                    'desc' => $this->l('Enter Your Post Meta Keyword. Separated by comma(,)')
                ),
                array(
                    'type' => 'textarea',
                    'label' => $this->l('Short Description'),
                    'name' => 'short_description',
                    'rows' => 10,
                    'cols' => 62,
                    'lang' => true,
                    'required' => true,
                    'desc' => $this->l('Enter Your Post Short Description')
                ),
                array(
                    'type' => 'textarea',
                    'label' => $this->l('Meta Description'),
                    'name' => 'meta_description',
                    'rows' => 10,
                    'cols' => 62,
                    'lang' => true,
                    'required' => false,
                    'desc' => $this->l('Enter Your Post Meta Description')
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Link Rewrite'),
                    'name' => 'link_rewrite',
                    'size' => 60,
                    'lang' => true,
                    'required' => false,
                    'desc' => $this->l('Enetr Your Post Slug. Use In SEO Friendly URL')
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Tag'),
                    'name' => 'tags',
                    'size' => 60,
                    'lang' => true,
                    'required' => false,
                    'desc' => $this->l('Enter Your Post Meta Tag. Separated by comma(,)')
                ),
                array(
                                        'type' => 'switch',
                                        'label' => $this->l('Comment Status'),
                                        'name' => 'comment_status',
                                        'required' => false,
                                        'class' => 't',
                                        'is_bool' => true,
                                        'values' => array(
                                            array(
                                            'id' => 'active',
                                            'value' => 1,
                                            'label' => $this->l('Enabled')
                                            ),
                                            array(
                                            'id' => 'active',
                                            'value' => 0,
                                            'label' => $this->l('Disabled')
                                            )
                                            ),
                                        'desc' => $this->l('You Can Enable or Disable Your Comments')
                                     ),
                array(
                                        'type' => 'switch',
                                        'label' => $this->l('Status'),
                                        'name' => 'active',
                                        'required' => false,
                                        'class' => 't',
                                        'is_bool' => true,
                                        'values' => array(
                                            array(
                                            'id' => 'active',
                                            'value' => 1,
                                            'label' => $this->l('Enabled')
                                            ),
                                            array(
                                            'id' => 'active',
                                            'value' => 0,
                                            'label' => $this->l('Disabled')
                                            )
                                            )
                                     ),array(
                                        'type' => 'switch',
                                        'label' => $this->l('Is Featured?'),
                                        'name' => 'is_featured',
                                        'required' => false,
                                        'class' => 't',
                                        'is_bool' => true,
                                        'values' => array(
                                            array(
                                            'id' => 'is_featured',
                                            'value' => 1,
                                            'label' => $this->l('Enabled')
                                            ),
                                            array(
                                            'id' => 'is_featured',
                                            'value' => 0,
                                            'label' => $this->l('Disabled')
                                            )
                                            )
                                     )
            ),
            'submit' => array(
                'title' => $this->l('Save'),
                'class' => 'button btn btn-default'
            )
        );
        
         if (Shop::isFeatureActive())
		{
			$this->fields_form['input'][] = array(
				'type' => 'shop',
				'label' => $this->l('Shop association:'),
				'name' => 'checkBoxShopAsso',
			);
		}
                
        if (!($SmartAkciiPost = $this->loadObject(true)))
            return;
        
        $this->fields_form['submit'] = array(
            'title' => $this->l('Save   '),
            'class' => 'button btn btn-default'
        );
      
      $image = ImageManager::thumbnail(_MODULE_SMARTAKCII_DIR_ . $SmartAkciiPost->id_smart_akcii_post . '.jpg', $this->table . '_' . (int) $SmartAkciiPost->id_smart_akcii_post . '.' . $this->imageType, 350, $this->imageType, true);

        $this->fields_value = array(
            'image' => $image ? $image : false,
            'size' => $image ? filesize(_MODULE_SMARTAKCII_DIR_ . $SmartAkciiPost->id_smart_akcii_post . '.jpg') / 1000 : false
        );
            if(Tools::getvalue('id_smart_akcii_post') != '' && Tools::getvalue('id_smart_akcii_post') != NULL)
                 {
                    foreach (Language::getLanguages(false) as $lang)
                        {
                            $this->fields_value['tags'][(int)$lang['id_lang']] = SmartAkciiPost::getProductTagsBylang((int)Tools::getvalue('id_smart_akcii_post'), (int)$lang['id_lang']);
                        }
                 }
        return parent::renderForm();
    }
    
    public function initToolbar() {
        
        parent::initToolbar();
    }
    public function updateTags($languages, $post)
	{
		$tag_success = true;
		if (!SmartAkciiPost::deleteTagsForProduct((int)$post->id))
			$this->errors[] = Tools::displayError('An error occurred while attempting to delete previous tags.');
		foreach ($languages as $language)
			if ($value = Tools::getValue('tags_'.$language['id_lang']))
				$tag_success &= SmartAkciiPost::addTags($language['id_lang'],(int)$post->id, $value);
                              
		if (!$tag_success)
			$this->errors[] = Tools::displayError('An error occurred while adding tags.');
		return $tag_success;
	}
}
