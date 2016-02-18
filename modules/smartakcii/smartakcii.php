<?php
if (!defined('_PS_VERSION_'))
    exit;
define('_MODULE_SMARTAKCII_DIR_',_PS_MODULE_DIR_. 'smartakcii/images/' );
require_once (dirname(__FILE__) . '/classes/AkciiCategory.php');
require_once (dirname(__FILE__) . '/classes/Akciicomment.php');
require_once (dirname(__FILE__) . '/classes/AkciiPostCategory.php');
require_once (dirname(__FILE__) . '/classes/AkciiTag.php');
require_once (dirname(__FILE__) . '/classes/SmartAkciiPost.php');
require_once (dirname(__FILE__) . '/classes/AkciiImageType.php');

class smartakcii extends Module {

	public function __construct(){
		$this->name = 'smartakcii';
		$this->tab = 'front_office_features';
		$this->version = '2.0.1';
		$this->author = 'SmartDataSoft';
		$this->need_upgrade = false;
		$this->controllers = array('archive', 'category', 'details', 'search', 'tagpost');
		$this->secure_key = Tools::encrypt($this->name);
		$this->smart_shop_id = Context::getContext()->shop->id;
		$this->bootstrap = true;
		parent::__construct();
		$this->displayName = $this->l('Smart Akcii');
		$this->description = $this->l('The Most Powerfull Presta shop Akcii  Module - by smartdatasoft');
		$this->confirmUninstall = $this->l('Are you sure you want to delete your details ?');
	}

    public function install()
	{
		Configuration::updateGlobalValue('smartakciipostperpage', '5');
		Configuration::updateGlobalValue('smartakciishowauthorstyle', '1');
		Configuration::updateGlobalValue('smartmainakciiurl', 'smartakcii');
		Configuration::updateGlobalValue('smartakciiusehtml', '1');
		Configuration::updateGlobalValue('smartakciishowauthorstyle', '1');
		Configuration::updateGlobalValue('smartakciienablecomment', '1');
		Configuration::updateGlobalValue('smartakciicaptchaoption', '1');
		Configuration::updateGlobalValue('smartakciishowviewed', '1');
		Configuration::updateGlobalValue('smartakciishownoimg', '1');
		Configuration::updateGlobalValue('smartakciishowcolumn', '3');
		Configuration::updateGlobalValue('smartakciiacceptcomment', '1'); 
		Configuration::updateGlobalValue('smartakciicustomcss', ''); 
		Configuration::updateGlobalValue('smartakciidisablecatimg','1'); 
		Configuration::updateGlobalValue('smartakciimetatitle', 'Smart Bolg Title'); 
		Configuration::updateGlobalValue('smartakciimetakeyword', 'smart,akcii,smartakcii,prestashop akcii,prestashop,akcii'); 
		Configuration::updateGlobalValue('smartakciimetadescrip', 'Prestashop powerfull akcii site developing module. It has hundrade of extra plugins. This module developed by SmartDataSoft.com'); 

		$this->addquickaccess();

		$langs = Language::getLanguages();
		
		if (!parent::install() ||
			!$this->registerHook('displayHeader') ||
			!$this->SmartHookInsert() ||
			!$this->registerHook('moduleRoutes') ||
			!$this->registerHook('displayBackOfficeHeader')
            )
		return false;

		$sql = array();

		require_once(dirname(__FILE__) . '/sql/install.php');

		foreach ($sql as $sq) :
			if (!Db::getInstance()->Execute($sq))
				return false;
		endforeach;

		$this->CreateSmartAkciiTabs();
		$this->SampleDataInstall();

		return true;
	}

	public function hookdisplayBackOfficeHeader($params)
	{
		$this->smarty->assign(array(
					'smartmodules_dir' => __PS_BASE_URI__
					));
		return $this->display(__FILE__, 'views/templates/admin/addjs.tpl');
	}

	public function SmartHookInsert()
	{
		$hookvalue = array();

		require_once(dirname(__FILE__) . '/sql/addhook.php');

		foreach ($hookvalue as $hkv)
		{
			$hookid = Hook::getIdByName($hkv['name']);

			if (!$hookid)
			{
				$add_hook = new Hook();
				$add_hook->name = pSQL($hkv['name']);
				$add_hook->title = pSQL($hkv['title']);
				$add_hook->description = pSQL($hkv['description']);
				$add_hook->position = pSQL($hkv['position']);
				$add_hook->live_edit = $hkv['live_edit'];
				$add_hook->add();
				$hookid = $add_hook->id;

				if (!$hookid)
					return false;
			}
			else
			{
				$up_hook = new Hook($hookid);
				$up_hook->update();
			}
		}

		return true;
	}

	public function uninstall()
	{
		if (!parent::uninstall() ||
            !Configuration::deleteByName('smartakciimetatitle') ||
            !Configuration::deleteByName('smartakciimetakeyword') ||
            !Configuration::deleteByName('smartakciimetadescrip') ||
            !Configuration::deleteByName('smartakciipostperpage') ||
            !Configuration::deleteByName('smartakciiacceptcomment') ||
            !Configuration::deleteByName('smartakciiusehtml') ||
            !Configuration::deleteByName('smartakciicaptchaoption') ||
            !Configuration::deleteByName('smartakciishowviewed') ||
            !Configuration::deleteByName('smartakciidisablecatimg') ||
            !Configuration::deleteByName('smartakciienablecomment') ||
            !Configuration::deleteByName('smartmainakciiurl') ||
            !Configuration::deleteByName('smartakciishowcolumn') ||
            !Configuration::deleteByName('smartakciishowauthorstyle') ||
            !Configuration::deleteByName('smartakciicustomcss') ||
            !Configuration::deleteByName('smartakciishownoimg') ||
            !Configuration::deleteByName('smartshowauthor') 
			)

		return false;

		require_once(dirname(__FILE__) . '/sql/uninstall_tab.php');

		foreach ($idtabs as $tabid):
            if ($tabid)
			{
				$tab = new Tab($tabid);
				$tab->delete();
			}
		endforeach;

		$sql = array();

		require_once(dirname(__FILE__) . '/sql/uninstall.php');

		foreach ($sql as $s) :
			if (!Db::getInstance()->Execute($s))
				return false;
		endforeach;

		$this->SmartHookDelete();
		$this->deletequickaccess();

		return true;
	}
	
	public function SmartHookDelete()
	{
		$hookvalue = array();

		require_once(dirname(__FILE__) . '/sql/addhook.php');

		foreach ($hookvalue as $hkv){
			$hookid = Hook::getIdByName($hkv['name']);

			if ($hookid)
			{
				$dlt_hook = new Hook($hookid);
				$dlt_hook->delete();
			}
		}
	}

	public function hookModuleRoutes($params)
	{
		$alias = Configuration::get('smartmainakciiurl');
		$usehtml = (int)Configuration::get('smartakciiusehtml');

		if($usehtml != 0)
		    $html = '.html';
        else
            $html = '';

		$my_link = array(
			'smartakcii' => array(
				'controller'	=> 'category',
				'rule'			=> $alias.$html,
				'keywords'		=> array(),
				'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_list' => array(
				'controller'	=> 'category',
				'rule'			=> $alias.'/category'.$html,
				'keywords'		=> array(),
				'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_list_module' => array(
				'controller'	=> 'category',
				'rule'			=> 'module/'.$alias.'/category'.$html,
				'keywords'		=> array(),
				'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_list_pagination' => array(
				'controller'	=> 'category',
				'rule'			=> $alias.'/category/page/{page}'.$html,
				'keywords'		=> array(
					'page'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'page'),
				),
				'params' => array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_pagination' => array(
				'controller'	=> 'category',
				'rule'			=> $alias.'/page/{page}'.$html,
				'keywords'		=> array(
					'page'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'page'),
				),
				'params' => array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_category' => array(
				'controller'	=> 'category',
				'rule'			=> $alias.'/category/{slug}'.$html,
				'keywords'		=> array(
					'id_category'	=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'id_category'),
					'slug'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'slug'),
				),
				'params' => array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_category_pagination' => array(
				'controller'	=> 'category',
				'rule'			=> $alias.'/category/{slug}/page/{page}'.$html,
				'keywords'		=> array(
					'id_category'	=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'id_category'),
					'page'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'page'),
                    'slug'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'slug'),
				),
				'params' => array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_cat_page_mod' => array(
				'controller'	=> 'category',
				'rule'			=> 'module/'.$alias.'/category/{slug}/page/{page}'.$html,
				'keywords' 		=> array(
					'id_category'	=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'id_category'),
					'page'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'page'),
					'slug'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'slug'),
				),
				'params' => array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_post' => array(
				'controller'	=> 'details',
				'rule'			=> $alias.'/{id_post}/{slug}'.$html,
				'keywords'		=> array(
					'id_post'		=>   array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'id_post'),
					'slug'			=>   array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'slug'),
				),
				'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_search' => array(
				'controller'	=> 'search',
				'rule'			=> $alias.'/search'.$html,
				'keywords'		=> array(),
				'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_tag' => array(
				'controller'	=> 'tagpost',
				'rule'			=> $alias.'/tag/{tag}'.$html,
				'keywords'		=> array(
					'tag'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'tag'),
                ),
                'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_search_pagination' => array(
				'controller'	=> 'search',
				'rule'			=> $alias.'/search/page/{page}'.$html,
				'keywords'		=> array(
					'page'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'page'),
				),
                'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_archive' => array(
				'controller'	=> 'archive',
				'rule'			=> $alias.'/archive'.$html,
				'keywords'		=> array(),
				'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
                ),
            ),
			'smartakcii_archive_pagination' => array(
				'controller'	=> 'archive',
				'rule'			=> $alias.'/archive/page/{page}'.$html,
				'keywords'		=> array(
					'page'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'page'),
				),
				'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_month' => array(
				'controller'	=> 'archive',
				'rule'			=> $alias.'/archive/{year}/{month}'.$html,
				'keywords'		=> array(
					'year'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'year'),
                    'month'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'month'),
				),
				'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_month_pagination' => array(
				'controller'	=> 'archive',
				'rule'			=> $alias.'/archive/{year}/{month}/page/{page}'.$html,
				'keywords'		=> array(
					'year'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'year'),
					'month'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'month'),
					'page'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'page'),
				),
				'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_year' => array(
                'controller'	=> 'archive',
				'rule'			=> $alias.'/archive/{year}'.$html,
				'keywords'		=> array(
					'year'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'year'),
				),
				'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
			'smartakcii_year_pagination' => array(
				'controller'	=> 'archive',
				'rule'			=> $alias.'/archive/{year}/page/{page}'.$html,
				'keywords'		=> array(
					'year'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'year'),
					'page'			=> array('regexp' => '[_a-zA-Z0-9-\pL]*', 'param' => 'page'),
				),
				'params'		=> array(
					'fc'			=> 'module',
					'module'		=> 'smartakcii',
				),
			),
		);

        return $my_link;
    }
    
	public function hookDisplayHeader($params)
	{
		$this->context->controller->addCSS($this->_path.'css/smartakciistyle.css', 'all');
	}

	private function CreateSmartAkciiTabs()
	{
		$langs = Language::getLanguages();
		$id_lang = (int)Configuration::get('PS_LANG_DEFAULT');
		$smarttab = new Tab();
		$smarttab->class_name = "AdminSmartAkcii";
		$smarttab->module = "";
		$smarttab->id_parent = 0;

		foreach ($langs as $l)
		{
			$smarttab->name[$l['id_lang']] = $this->l('Akcii');
		}

		$smarttab->save();
		$tab_id = $smarttab->id;
        @copy(dirname(__FILE__)."/AdminSmartAkcii.gif",_PS_ROOT_DIR_."/img/t/AdminSmartAkcii.gif");

		require_once(dirname(__FILE__) . '/sql/install_tab.php');

		foreach ($tabvalue as $tab)
		{
			$newtab = new Tab();
			$newtab->class_name = $tab['class_name'];
			$newtab->id_parent = $tab_id;
			$newtab->module = $tab['module'];

			foreach ($langs as $l)
			{
				$newtab->name[$l['id_lang']] = $this->l($tab['name']);
			}

			$newtab->save();
		}
			return true;
	}

	public function getContent()
	{
		$html = '';

		if(Tools::isSubmit('savesmartakcii'))
		{
			Configuration::updateValue('smartakciimetatitle', Tools::getvalue('smartakciimetatitle'));
			Configuration::updateValue('smartakciienablecomment', Tools::getvalue('smartakciienablecomment'));
			Configuration::updateValue('smartakciimetakeyword', Tools::getvalue('smartakciimetakeyword'));
			Configuration::updateValue('smartakciimetadescrip', Tools::getvalue('smartakciimetadescrip'));
			Configuration::updateValue('smartakciipostperpage', Tools::getvalue('smartakciipostperpage'));
			Configuration::updateValue('smartakciiacceptcomment', Tools::getvalue('smartakciiacceptcomment'));
			Configuration::updateValue('smartakciicaptchaoption', Tools::getvalue('smartakciicaptchaoption'));
			Configuration::updateValue('smartakciishowviewed', Tools::getvalue('smartakciishowviewed'));
			Configuration::updateValue('smartakciidisablecatimg', Tools::getvalue('smartakciidisablecatimg'));
			Configuration::updateValue('smartakciishowauthorstyle', Tools::getvalue('smartakciishowauthorstyle'));
			Configuration::updateValue('smartshowauthor', Tools::getvalue('smartshowauthor'));
			Configuration::updateValue('smartakciishowcolumn', Tools::getvalue('smartakciishowcolumn'));
			Configuration::updateValue('smartmainakciiurl', Tools::getvalue('smartmainakciiurl'));
			Configuration::updateValue('smartakciiusehtml', Tools::getvalue('smartakciiusehtml'));
			Configuration::updateValue('smartakciishownoimg', Tools::getvalue('smartakciishownoimg'));
			Configuration::updateValue('smartakciicustomcss', Tools::getvalue('smartakciicustomcss'),true);

			$this->processImageUpload($_FILES);
			$html = $this->displayConfirmation($this->l('The settings have been updated successfully.'));
			$helper = $this->SettingForm();
			$html .= $helper->generateForm($this->fields_form); 
			$helper = $this->regenerateform();
			$html .= $helper->generateForm($this->fields_form); 
				return $html;
		}
		elseif (Tools::isSubmit('generateimage'))
		{
			if(Tools::getvalue('isdeleteoldthumblr') != 1)
			{
				AkciiImageType::ImageGenerate();
				$html = $this->displayConfirmation($this->l('Generate New Thumblr Succesfully.'));
				$helper = $this->SettingForm();
				$html .= $helper->generateForm($this->fields_form); 
				$helper = $this->regenerateform();
				$html .= $helper->generateForm($this->fields_form);
 
				return $html;
			}
			else
			{
				AkciiImageType::ImageDelete();
				AkciiImageType::ImageGenerate();
				$html = $this->displayConfirmation($this->l('Delete Old Image and Generate New Thumblr Succesfully.'));
				$helper = $this->SettingForm();
				$html .= $helper->generateForm($this->fields_form); 
				$helper = $this->regenerateform();
				$html .= $helper->generateForm($this->fields_form); 
			return $html;
			}
 		}
		else
		{
			$helper = $this->SettingForm();
			$html .= $helper->generateForm($this->fields_form); 
			$helper = $this->regenerateform();
			$html .= $helper->generateForm($this->fields_form);

			return $html;
		}
	}

	public function SettingForm()
	{
		$akcii_url = smartakcii::GetSmartAkciiLink('smartakcii');
		$img_desc = '';
		$img_desc .= ''.$this->l('Upload a Avatar from your computer.<br/>N.B : Only jpg image is allowed');
		$img_desc .= '<br/><img style="clear:both;border:1px solid black;" alt="" src="'.__PS_BASE_URI__.'modules/smartakcii/images/avatar/avatar.jpg" height="100" width="100"/><br />';
		$default_lang = (int) Configuration::get('PS_LANG_DEFAULT');

		$this->fields_form[0]['form'] = array(
			'legend'	=> array(
			'title'	=> $this->l('Setting'),
			),
			'input' => array(
				array(
					'type' => 'text',
					'label' => $this->l('Meta Title'),
					'name' => 'smartakciimetatitle',
					'size' => 70,
					'required' => true
				),
				array(
					'type' => 'text',
					'label' => $this->l('Meta Keyword'),
					'name' => 'smartakciimetakeyword',
					'size' => 70,
					'required' => true
				),
				array(
					'type' => 'textarea',
					'label' => $this->l('Meta Description'),
					'name' => 'smartakciimetadescrip',
					'rows' => 7,
					'cols' => 66,
					'required' => true
				),
				array(
					'type' => 'text',
					'label' => $this->l('Main akcii Url'),
					'name' => 'smartmainakciiurl',
					'size' => 15,
					'required' => true,
					'desc'=> '<p class="alert alert-info"><a href="'.$akcii_url.'">'.$akcii_url.'</a></p>'
				),
				array(
					'type' => 'switch',
					'label' => $this->l('Use .html with Friendly Url'),
					'name' => 'smartakciiusehtml',
					'required' => false,
					'class' => 't',
					'is_bool' => true,
					'values' => array(
						array(
							'id' => 'smartakciiusehtml',
							'value' => 1,
							'label' => $this->l('Enabled')
						),
						array(
							'id' => 'smartakciiusehtml',
							'value' => 0,
							'label' => $this->l('Disabled')
							)
						)
				),
				array(
					'type' => 'text',
					'label' => $this->l('Number of posts per page'),
					'name' => 'smartakciipostperpage',
					'size' => 15,
					'required' => true
				),
				array(
					'type' => 'switch',
					'label' => $this->l('Auto accepted comment'),
					'name' => 'smartakciiacceptcomment',
					'required' => false,
					'class' => 't',
					'is_bool' => true,
					'values' => array(
						array(
							'id' => 'smartakciiacceptcomment',
							'value' => 1,
							'label' => $this->l('Enabled')
						),
						array(
							'id' => 'smartakciiacceptcomment',
							'value' => 0,
							'label' => $this->l('Disabled')
						)
					)
				),
				array(
					'type' => 'switch',
					'label' => $this->l('Enable Captcha'),
					'name' => 'smartakciicaptchaoption',
					'required' => false,
					'class' => 't',
					'is_bool' => true,
					'values' => array(
						array(
							'id' => 'smartakciicaptchaoption',
							'value' => 1,
							'label' => $this->l('Enabled')
						),
						array(
							'id' => 'smartakciicaptchaoption',
							'value' => 0,
							'label' => $this->l('Disabled')
						)
					)
				),
                array(
					'type' => 'switch',
					'label' => $this->l('Enable Comment'),
					'name' => 'smartakciienablecomment',
					'required' => false,
					'class' => 't',
					'is_bool' => true,
					'values' => array(
						array(
							'id' => 'smartakciienablecomment',
							'value' => 1,
							'label' => $this->l('Enabled')
						),
						array(
							'id' => 'smartakciienablecomment',
							'value' => 0,
							'label' => $this->l('Disabled')
						)
					)
				),
				array(
					'type' => 'switch',
					'label' => $this->l('Show Author Name'),
					'name' => 'smartshowauthor',
					'required' => false,
					'class' => 't',
					'is_bool' => true,
					'values' => array(
						array(
							'id' => 'smartshowauthor',
							'value' => 1,
							'label' => $this->l('Enabled')
						),
						array(
							'id' => 'smartshowauthor',
							'value' => 0,
							'label' => $this->l('Disabled')
						)
					)
				),
				array(
					'type' => 'switch',
					'label' => $this->l('Show Post Viewed'),
					'name' => 'smartakciishowviewed',
					'required' => false,
					'class' => 't',
					'is_bool' => true,
					'values' => array(
						array(
							'id' => 'smartakciishowviewed',
							'value' => 1,
							'label' => $this->l('Enabled')
						),
						array(
							'id' => 'smartakciishowviewed',
							'value' => 0,
							'label' => $this->l('Disabled')
						)
					)
				),
                array(
					'type' => 'switch',
					'label' => $this->l('Show Author Name Style'),
					'name' => 'smartakciishowauthorstyle',
					'required' => false,
					'class' => 't',
					'values' => array(
						array(
							'id' => 'smartakciishowauthorstyle',
							'value' => 1,
							'label' => $this->l('First Name, Last Name')
						),
						array(
							'id' => 'smartakciishowauthorstyle',
							'value' => 0,
							'label' => $this->l('Last Name, First Name')
						)
					)
				),
				array(
					'type' => 'file',
					'label' => $this->l('AVATAR Image:'),
					'name' => 'avatar',
					'display_image' => false,
					'desc' => $img_desc
				),
				array(
					'type' => 'switch',
					'label' => $this->l('Show No Image'),
					'name' => 'smartakciishownoimg',
					'required' => false,
					'class' => 't',
					'is_bool' => true,
					'values' => array(
						array(
							'id' => 'smartakciishownoimg',
							'value' => 1,
							'label' => $this->l('Enabled')
						),
						array(
							'id' => 'smartakciishownoimg',
							'value' => 0,
							'label' => $this->l('Disabled')
						)
					)
				),
				array(
					'type' => 'switch',
					'label' => $this->l('Show Category'),
					'name' => 'smartakciidisablecatimg',
					'required' => false,
					'class' => 't',
					'desc'=>'Show category image and description on category page',
					'is_bool' => true,
					'values' => array(
						array(
							'id' => 'smartakciidisablecatimg',
							'value' => 1,
							'label' => $this->l('Enabled')
						),
						array(
							'id' => 'smartakciidisablecatimg',
							'value' => 0,
							'label' => $this->l('Disabled')
						)
					)
				),
				array(
					'type' => 'radio',
					'label' => $this->l('Akcii Page Column Setting'),
					'name' => 'smartakciishowcolumn',
					'required' => false,
					'class' => 't',
					'values' => array(
						array(
							'id' => 'smartakciishowcolumn',
							'value' => 0,
							'label' => $this->l('Use Both SmartAkcii Column')
						),
						array(
							'id' => 'smartakciishowcolumn',
							'value' => 1,
							'label' => $this->l('Use Only SmartAkcii Left Column')
						),
						array(
							'id' => 'smartakciishowcolumn',
							'value' => 2,
							'label' => $this->l('Use Only SmartAkcii Right Column')
						),
						array(
							'id' => 'smartakciishowcolumn',
							'value' => 3,
							'label' => $this->l('Use Prestashop Column')
						)
					)
				),
				array(
					'type' => 'textarea',
					'label' => $this->l('Custom CSS'),
					'name' => 'smartakciicustomcss',
					'rows' => 7,
					'cols' => 66,
					'required' => false
				),
			),
			'submit' => array(
				'title' => $this->l('Save'),
				'class' => 'button btn btn-default'
			)
		);

		$helper = new HelperForm();
		$helper->module = $this;
		$helper->name_controller = $this->name;
		$helper->token = Tools::getAdminTokenLite('AdminModules');
		$helper->currentIndex = AdminController::$currentIndex . '&configure=' . $this->name;

		foreach (Language::getLanguages(false) as $lang)
			$helper->languages[] = array(
									'id_lang' => $lang['id_lang'],
									'iso_code' => $lang['iso_code'],
									'name' => $lang['name'],
									'is_default' => ($default_lang == $lang['id_lang'] ? 1 : 0)
								);

		$helper->toolbar_btn = array(
								'save' =>
									array(
										'desc' => $this->l('Save'),
										'href' => AdminController::$currentIndex . '&configure=' . $this->name . '&save'.$this->name.'token=' . Tools::getAdminTokenLite('AdminModules'),
									)
								);

		$helper->default_form_language = $default_lang;
		$helper->allow_employee_form_lang = $default_lang;
		$helper->title = $this->displayName;
		$helper->show_toolbar = true;
		$helper->toolbar_scroll = true;    
		$helper->submit_action = 'save'.$this->name;
		
		$helper->fields_value['smartakciipostperpage'] = Configuration::get('smartakciipostperpage');
		$helper->fields_value['smartakciiacceptcomment'] = Configuration::get('smartakciiacceptcomment');
		$helper->fields_value['smartakciishowauthorstyle'] = Configuration::get('smartakciishowauthorstyle');
		$helper->fields_value['smartshowauthor'] = Configuration::get('smartshowauthor');
		$helper->fields_value['smartmainakciiurl'] = Configuration::get('smartmainakciiurl');
		$helper->fields_value['smartakciiusehtml'] = Configuration::get('smartakciiusehtml');
		$helper->fields_value['smartakciishowcolumn'] = Configuration::get('smartakciishowcolumn');
		$helper->fields_value['smartakciimetakeyword'] = Configuration::get('smartakciimetakeyword');
		$helper->fields_value['smartakciimetatitle'] = Configuration::get('smartakciimetatitle');
		$helper->fields_value['smartakciimetadescrip'] = Configuration::get('smartakciimetadescrip');
		$helper->fields_value['smartakciishowviewed'] = Configuration::get('smartakciishowviewed');
		$helper->fields_value['smartakciidisablecatimg'] = Configuration::get('smartakciidisablecatimg');
		$helper->fields_value['smartakciienablecomment'] = Configuration::get('smartakciienablecomment');
		$helper->fields_value['smartakciicustomcss'] = Configuration::get('smartakciicustomcss');
		$helper->fields_value['smartakciishownoimg'] = Configuration::get('smartakciishownoimg');
		$helper->fields_value['smartakciicaptchaoption'] = Configuration::get('smartakciicaptchaoption');

		return $helper;
	}

	protected function regenerateform()
	{
		$default_lang = (int)Configuration::get('PS_LANG_DEFAULT');

		$this->fields_form[0]['form'] = array(
										'legend' => array(
										'title' => $this->l('Akcii Thumblr Configuration'),
									),
									'input' => array(
											array(
												'type' => 'switch',
												'label' => $this->l('Delete Old Thumblr'),
												'name' => 'isdeleteoldthumblr',
												'required' => false,
												'class' => 't',
												'is_bool' => true,
												'values' => array(
													array(
														'id' => 'isdeleteoldthumblr',
														'value' => 1,
														'label' => $this->l('Enabled')
													),
													array(
														'id' => 'isdeleteoldthumblr',
														'value' => 0,
														'label' => $this->l('Disabled')
													)
												)
											 )
                                        
										),
									'submit' => array(
												'title' => $this->l('Re Generate Thumblr'),
												'class' => 'button btn btn-default'
												)
									);
                    
						$helper = new HelperForm();
						$helper->module = $this;
						$helper->name_controller = $this->name;
						$helper->token = Tools::getAdminTokenLite('AdminModules');
						foreach (Language::getLanguages(false) as $lang)
								$helper->languages[] = array(
										'id_lang' => $lang['id_lang'],
										'iso_code' => $lang['iso_code'],
										'name' => $lang['name'],
										'is_default' => ($default_lang == $lang['id_lang'] ? 1 : 0)
								);
						$helper->currentIndex = AdminController::$currentIndex . '&configure=' . $this->name;
						$helper->default_form_language = $default_lang;
						$helper->allow_employee_form_lang = $default_lang;
						$helper->toolbar_scroll = true;
						$helper->show_toolbar = false;
						$helper->submit_action = 'generateimage';
						$helper->fields_value['isdeleteoldthumblr'] = Configuration::get('isdeleteoldthumblr');

						return $helper;
	}

	public function processImageUpload($FILES)
	{
		if (isset($FILES['avatar']) && isset($FILES['avatar']['tmp_name']) && !empty($FILES['avatar']['tmp_name']))
		{
			if ($error = ImageManager::validateUpload($FILES['avatar'], 4000000))
            	return $this->displayError($this->l('Invalid image'));
            else
			{
				$ext = substr($FILES['avatar']['name'], strrpos($FILES['avatar']['name'], '.') + 1);
				$file_name = 'avatar.' . $ext;
				$path = _PS_MODULE_DIR_ .'smartakcii/images/avatar/' . $file_name;
				if (!move_uploaded_file($FILES['avatar']['tmp_name'], $path))
					return $this->displayError($this->l('An error occurred while attempting to upload the file.'));
				else
				{
					$author_types = AkciiImageType::GetImageAllType('author');

					foreach ($author_types as  $image_type)
					{
						$dir = _PS_MODULE_DIR_ .'smartakcii/images/avatar/avatar-'.stripslashes($image_type['type_name']).'.jpg';
							if (file_exists($dir))	
								unlink($dir);
					}
					
					$images_types = AkciiImageType::GetImageAllType('author');

					foreach ($images_types as $image_type)
					{
						ImageManager::resize($path,_PS_MODULE_DIR_ .'smartakcii/images/avatar/avatar-'.stripslashes($image_type['type_name']).'.jpg',
							(int)$image_type['width'], (int)$image_type['height']
						);
					}
				}
			}
		}
	}
    
	public function SampleDataInstall()
	{
			$damisql = "INSERT INTO "._DB_PREFIX_."smart_akcii_category (id_parent,active) VALUES (0,1);";
            Db::getInstance()->execute($damisql); 

			$damisq1l = "INSERT INTO "._DB_PREFIX_."smart_akcii_category_shop (id_smart_akcii_category,id_shop) VALUES (1,'".(int)$this->smart_shop_id."');";
			Db::getInstance()->execute($damisq1l); 

			$languages = Language::getLanguages(false);
			foreach ($languages as $language)
 			{
				$damisql2 = "INSERT INTO "._DB_PREFIX_."smart_akcii_category_lang (id_smart_akcii_category,meta_title,id_lang,link_rewrite) VALUES (1,'Uncategories','".(int)$language['id_lang']."','uncategories');";
				Db::getInstance()->execute($damisql2);
			}
			for ($i = 1; $i <= 4; $i++)
			{
				Db::getInstance()->Execute('
					INSERT INTO `'._DB_PREFIX_.'smart_akcii_post`(`id_author`, `id_category`, `position`, `active`, `available`, `created`, `viewed`, `comment_status`, `post_type`) 
					VALUES(1,1,0,1,1,"'.Date('y-m-d H:i:s').'",0,1,0)');
			}
                        
			$languages = Language::getLanguages(false);

			for ($i = 1; $i <= 4; $i++)
			{
				if($i==1):
					$title='Lorem ipsum dolor sit amet';
					$slug='lorem-ipsum-dolor-sit-amet';
					$des='Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vestibulum erat at neque fermentum, in auctor justo hendrerit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce id felis tempor, mollis ligula ac, iaculis massa. Aliquam nec mollis neque, eget laoreet nibh. Vivamus dictum tempor enim, a porttitor dui lacinia vitae.';
				elseif($i==2):
					$title='Cras in sem in arcu ultrices';
					$slug='cras-in-sem-in-arcu-ultrices';
					$des='Cras in sem in arcu ultrices egestas sit amet nec metus. Suspendisse magna nisi, cursus ut condimentum eu, dapibus at dolor. Sed venenatis sapien quis urna consequat, quis tempor neque porttitor. Vivamus iaculis eleifend varius. Vestibulum quis justo massa. Mauris et eros mollis, placerat mauris nec, mattis purus.';
				elseif($i==3):
					$title='Aliquam elementum lorem ac efficitur tristique';
					$slug='aliquam-elementum-lorem-ac-efficitur-tristique';
					$des=' Aliquam elementum lorem ac efficitur tristique. Duis vehicula non sapien eget rhoncus. Nulla et congue nunc, id eleifend neque. In hac habitasse platea dictumst. Nunc lacinia fringilla mi. Praesent quam nunc, pretium et aliquam ut, sollicitudin vel augue. Donec semper luctus felis, ut condimentum nisl facilisis eget. Morbi ac laoreet neque. Sed luctus dapibus lorem ut egestas.'; 
				elseif($i==4):
					$title='Pellentesque sollicitudin iaculis gravida';
					$slug='pellentesque-sollicitudin-iaculis-gravida';
					$des='Pellentesque sollicitudin iaculis gravida. Praesent ac tortor dapibus, imperdiet arcu in, aliquet est. Praesent ut risus tincidunt, euismod diam sit amet, vulputate dui. Cras luctus turpis non quam pretium, quis ornare libero vulputate. Nullam felis felis, vestibulum ac placerat sit amet, pretium ut dolor.';
				elseif($i==5):
					$title='Quisque commodo sit amet lectus';
					$slug='quisque-commodo-sit-amet-lectus';
					$des='Quisque commodo sit amet lectus eget rutrum. Quisque ut quam hendrerit, cursus eros ut, tincidunt magna. Nunc ut leo blandit, feugiat orci non, laoreet tellus. Proin tincidunt ex a rhoncus mattis. Ut imperdiet consectetur lacus ac convallis. Etiam interdum metus lectus, sed efficitur felis porta nec. Etiam eleifend neque velit. Sed semper faucibus arcu, a mollis justo luctus nec.';
				elseif($i==6):
					$title='Vivamus vitae laoreet erat, eget egestas est';
					$slug='vivamus-vitae-laoreet-erat';
					$des='Vivamus vitae laoreet erat, eget egestas est. Donec at auctor arcu, at suscipit orci. Quisque vel risus odio. In porttitor, neque et cursus interdum, lacus felis scelerisque risus, id euismod sapien lorem et tortor. Curabitur augue sem, lobortis vitae sapien sit amet, tempus posuere sapien. Aenean ut felis a orci volutpat maximus quis lobortis sem.';
				endif;		 

				foreach ($languages as $language)
				{
					if(!Db::getInstance()->Execute('
						INSERT INTO `'._DB_PREFIX_.'smart_akcii_post_lang`(`id_smart_akcii_post`,`id_lang`,`meta_title`,`meta_description`,`short_description`,`content`,`link_rewrite`)
						VALUES('.$i.','.(int)$language['id_lang'].', 
							"'.htmlspecialchars($title).'", 
							"'.htmlspecialchars($des).'","'.substr($des,0,200).'","'.htmlspecialchars($des).'","'.$slug.'"
						)'))

						return false;
				}
			}
			for ($i = 1; $i <= 4; $i++)
			{
				Db::getInstance()->Execute('
					INSERT INTO `'._DB_PREFIX_.'smart_akcii_post_shop`(`id_smart_akcii_post`, `id_shop`) 
					VALUES('.$i.','.(int)$this->smart_shop_id.')');
			}
			for($i=1;$i <= 7;$i++)
			{
				if($i==1):
					$type_name = 'home-default';
					$width = '270';
					$height = '180';
					$type = 'post';
				elseif($i==2):
					$type_name = 'home-small';
					$width = '98';
					$height = '65';
					$type = 'post';
				elseif($i==3):
					$type_name = 'single-default';
					$width = '870';
					$height = '580';
					$type = 'post';
				elseif($i==4):
					$type_name = 'home-small';
					$width = '65';
					$height = '65';
					$type = 'Category';
				elseif($i==5):
					$type_name = 'home-default';
					$width = '240';
					$height = '240';
					$type = 'Category';
				elseif($i==6):
					$type_name = 'single-default';
					$width = '800';
					$height = '800';
					$type = 'Category';
				elseif($i==7):
					$type_name = 'author-default';
					 $width = '100';
					 $height = '100';
					 $type = 'Author';
				 endif;
	
				$damiimgtype = "INSERT INTO "._DB_PREFIX_."smart_akcii_imagetype (type_name,width,height,type,active) VALUES ('".$type_name."','".$width."','".$height."','".$type."',1);";
				Db::getInstance()->execute($damiimgtype); 
			}

		return true;
	}
    
	public static function GetSmartAkciiUrl()
	{
		$ssl_enable = Configuration::get('PS_SSL_ENABLED');
		$id_lang = (int)Context::getContext()->language->id;
		$id_shop = (int)Context::getContext()->shop->id;
		$rewrite_set = (int)Configuration::get('PS_REWRITING_SETTINGS');
		$ssl = null;
		static $force_ssl = null;

		if ($ssl === null)
		{
			if ($force_ssl === null)
				$force_ssl = (Configuration::get('PS_SSL_ENABLED') && Configuration::get('PS_SSL_ENABLED_EVERYWHERE'));
			$ssl = $force_ssl;
		}

		if (Configuration::get('PS_MULTISHOP_FEATURE_ACTIVE') && $id_shop !== null)
			$shop = new Shop($id_shop);
		else
			$shop = Context::getContext()->shop;

		$base = (($ssl && $ssl_enable) ? 'https://'.$shop->domain_ssl : 'http://'.$shop->domain);   
		$langUrl = Language::getIsoById($id_lang).'/';

		if ((!$rewrite_set && in_array($id_shop, array((int)Context::getContext()->shop->id,  null))) || !Language::isMultiLanguageActivated($id_shop) || !(int)Configuration::get('PS_REWRITING_SETTINGS', null, null, $id_shop))
			$langUrl = '';

		return $base.$shop->getBaseURI().$langUrl;
	}
           
    public static function GetSmartAkciiLink($rewrite = 'smartakcii', $params = null, $id_shop = null, $id_lang = null)
	{
		$url = smartakcii::GetSmartAkciiUrl();
		$dispatcher = Dispatcher::getInstance();

		if($params != null)
			return $url.$dispatcher->createUrl($rewrite, $id_lang, $params);
		return $url.$dispatcher->createUrl($rewrite);
	}

	public function addquickaccess()
	{
		$link = new Link();
		$qa = new QuickAccess();
		$qa->link = $link->getAdminLink('AdminModules').'&configure=smartakcii';

		$languages = Language::getLanguages(false);
		foreach ($languages as $language)
			$qa->name[$language['id_lang']] = 'Smart Akcii Setting';

		$qa->new_window = '0';

		if($qa->save())
			Configuration::updateValue('smartakcii_quick_access',$qa->id);
	}

	public function deletequickaccess()
	{
		$qa = new QuickAccess(Configuration::get('smartakcii_quick_access'));
		$qa->delete();
	}

	public static function slug2id($slug) {
		$sql = 'SELECT p.id_smart_akcii_post 
				FROM `'._DB_PREFIX_.'smart_akcii_post_lang` p 
				WHERE p.link_rewrite =  "'.$slug.'"';

		if(!$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql))														 
			return false;
		return $result[0]['id_smart_akcii_post'];
	}

	public static function categoryslug2id($slug) {
		$sql = 'SELECT p.id_smart_akcii_category 
				FROM `'._DB_PREFIX_.'smart_akcii_category_lang` p 
				WHERE p.link_rewrite =  "'.$slug.'"';

		if(!$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql))
			return false;
		return $result[0]['id_smart_akcii_category'];
	}
}