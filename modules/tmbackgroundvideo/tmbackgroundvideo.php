<?php 
if (!defined('_PS_VERSION_'))
	exit;

class TmBackgroundVideo extends Module
{
	public function __construct()
	{
        $this->name = 'tmbackgroundvideo';
		$this->tab = 'front_office_features';
		$this->version = '0.1';
		$this->author = 'TemplateMonster (Mlir)';
		$this->need_instance = 0;
		$this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
		$this->bootstrap = true;

		parent::__construct();

		$this->displayName = $this->l('Background video module');
        $this->description = $this->l('Module adds background video to the selected block.');

		$this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
	}

	public function install()
	{
		if (Shop::isFeatureActive())
			Shop::setContext(Shop::CONTEXT_ALL);

		if (!parent::install()
			|| !$this->installDB()
			|| !$this->registerHook('displayHeader'))
			return false;
		return true;
	}

	private function installDB()
	{
        return (
            Db::getInstance()->Execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'tmbackgroundvideo`')
            && Db::getInstance()->Execute('
				CREATE TABLE `'._DB_PREFIX_.'tmbackgroundvideo` (
						`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
						`id_shop` int(10) unsigned NOT NULL,
						`selector` VARCHAR(64),
                        `href` VARCHAR(64),
						`imgname` VARCHAR(64),
						`type` VARCHAR(32),	
                        `loop` VARCHAR(32),
                        `pause_on_scroll` VARCHAR(32),
						PRIMARY KEY (`id`)
				) ENGINE = '._MYSQL_ENGINE_.' DEFAULT CHARSET=UTF8;'));
	}
	public function uninstall()
	{
        if (!Db::getInstance()->Execute('DROP TABLE IF EXISTS `'._DB_PREFIX_.'tmbackgroundvideo`')
            ||!parent::uninstall())
            return false;
        return true;
	}

	public function getContent()
	{
		$output = null;
        if (Tools::isSubmit('newItem'))
            $output .= $this->addItem();
        elseif (Tools::isSubmit('updateItem'))
        {
            $this->updateItem();
            $output .= $this->displayConfirmation($this->l('Item updated.'));
        }
        elseif (Tools::isSubmit('removeItem'))
        {
            $this->removeItem();
            $output .= $this->displayConfirmation($this->l('Item removed.'));
        }
        $this->getItems();
        
        return $this->display(__FILE__, 'views/templates/admin/tmbackgroundvideo.tpl');
	}
    public function addItem()
    {
        $data = $this->getData();
        if (!Db::getInstance()->Execute('
        INSERT INTO `'._DB_PREFIX_.'tmbackgroundvideo` ( 
            `id_shop`, `selector`, `href`, `imgname`, `type`, `loop`, `pause_on_scroll`
				) VALUES ( 
						\''.(int)$this->context->shop->id.'\',
						\''.pSQL($data['selector']).'\',
						\''.pSQL($data['href']).'\',
						\''.pSQL($data['imgname']).'\',
						\''.pSQL($data['type']).'\',
                        \''.pSQL($data['loop']).'\',
                        \''.pSQL($data['pause_on_scroll']).'\'
						)
            '));
        $message = $this->displayConfirmation($this->l('Item added.'));
        return $message;
    }
    public function getItems()
    {
        $items = Db::getInstance()->ExecuteS('
			SELECT * FROM `'._DB_PREFIX_.'tmbackgroundvideo` 
			WHERE id_shop = '.(int)$this->context->shop->id.'		
			ORDER BY id ASC'
                                            );

        $this->context->smarty->assign('items', $items);

        return $items;
    }
    public function removeItem()
    {
        $item_id = (int)Tools::getValue('item_id');

        Db::getInstance()->delete(_DB_PREFIX_.'tmbackgroundvideo', 'id = '.(int)$item_id);
    }
    public function updateItem()
    {
        $data = $this->getData();

        if (!Db::getInstance()->Execute('
			UPDATE `'._DB_PREFIX_.'tmbackgroundvideo` SET 
					`selector` = \''.$data['selector'].'\',
					`href` = \''.$data['href'].'\',
					`imgname` = \''.$data['imgname'].'\',
					`type` = \''.$data['type'].'\',
                    `loop` = \''.$data['loop'].'\',
                    `pause_on_scroll` = \''.$data['pause_on_scroll'].'\'	
			WHERE id = '.(int)Tools::getValue('item_id')
                                       ));
    }
    public function getData()
    {
        $filename = $this->uploadImg();
        
        $data['selector']		= Tools::getValue('item_selector');
        $data['type']			= Tools::getValue('item_type');
        $data['imgname']        = $filename;
        $data['href']           = Tools::getValue('item_href');
        $data['loop']           = Tools::getValue('loop');
        $data['pause_on_scroll']= Tools::getValue('pauseos');
       
        return $data;
    }
    public function hookDisplayHeader()
    {
        $this->context->controller->addJS($this->_path.'views/js/jquery.youtubebackground.js');
        $this->context->controller->addCSS($this->_path.'views/css/tmbackgroundvideo.css');
        $this->context->controller->addJS($this->_path.'views/js/device.min.js'); 
        $this->context->smarty->assign('media_path', 'modules/tmbackgroundvideo/media/');
        $this->getItems();
        return $this->display(__FILE__, 'tmbackgroundvideo.tpl');
    }
    public function uploadImg()
    {
        $uploaddir = _PS_MODULE_DIR_.'tmbackgroundvideo/media/';
        $filename ="";

        //check iа any files uploaded
        if (Tools::strlen($_FILES['item_filename']['name'][0]) > 0)
        {
            $tmp_name = $_FILES['item_filename']['tmp_name'][0];
            $name = $_FILES['item_filename']['name'][0];
            $filename = $name;
            move_uploaded_file($tmp_name, "$uploaddir/$name");
            return $filename;
        }

        return false;
    }
}