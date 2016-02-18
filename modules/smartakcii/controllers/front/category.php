<?php

include_once(dirname(__FILE__).'/../../classes/controllers/FrontController.php');
class smartakciiCategoryModuleFrontController extends smartakciiModuleFrontController
{
    public $ssl = true;
    public $smartakciiCategory;

    public function init(){
		parent::init();
    }

	public function initContent(){
		parent::initContent();

		$category_status = '';
        $totalpages = '';
        $cat_image = 'no';
        $categoryinfo = '';
        $title_category = '';
        $cat_link_rewrite = '';
        $akciicomment = new Akciicomment();
        $SmartAkciiPost = new SmartAkciiPost();
        $AkciiCategory = new AkciiCategory();
        $AkciiPostCategory = new AkciiPostCategory();

		$SmartAkcii = new smartakcii();
		$slug = Tools::getValue('slug');
		$id_category = $SmartAkcii->categoryslug2id($slug);

		$posts_per_page = Configuration::get('smartpostperpage');
        $limit_start = 0;
        $limit = $posts_per_page;

		if (!$id_category)
			$total = $SmartAkciiPost->getToltal($this->context->language->id);
		else
		{
			$total = $SmartAkciiPost->getToltalByCategory($this->context->language->id, $id_category);
			Hook::exec('actionsbcat', array('id_category' => $id_category));
		}

		if($total != '' || $total != 0)
			$totalpages = ceil($total/$posts_per_page);

			if((boolean)Tools::getValue('page')){
				$c = Tools::getValue('page');
				$limit_start = $posts_per_page * ($c - 1);
            }

			if(!$id_category)
				$allNews = $SmartAkciiPost->getAllPost($this->context->language->id, $limit_start,$limit);
			else
			{
				if (file_exists(_PS_MODULE_DIR_.'smartakcii/images/category/' . $id_category. '.jpg'))
					$cat_image =   $id_category;
				else
					$cat_image = 'no';

				$categoryinfo = $AkciiCategory->getNameCategory($id_category);
				$title_category = $categoryinfo[0]['meta_title'];
				$category_status = $categoryinfo[0]['active'];
				$cat_link_rewrite = $categoryinfo[0]['link_rewrite'];

				if ($category_status == 1)
					$allNews = $AkciiPostCategory->getToltalByCategory($this->context->language->id,$id_category,$limit_start,$limit);
				elseif ($category_status == 0)
					$allNews = '';
			}

			$i = 0;

			if (!empty($allNews))
			{
				foreach ($allNews as $item)
				{
					$to[$i] = $akciicomment->getToltalComment($item['id_post']);
					$i++;
				}

				$j = 0;
                foreach ($to as $item)
				{
					if($item == '')
						$allNews[$j]['totalcomment'] = 0;
					else
						$allNews[$j]['totalcomment'] = $item;

					$j++;
				}
			}

			$this->context->smarty->assign( array(
				'postcategory' => $allNews,
				'category_status' => $category_status,
				'title_category' => $title_category,
				'cat_link_rewrite' => $cat_link_rewrite,
				'id_category' => $id_category,
				'cat_image' => $cat_image,
				'categoryinfo' => $categoryinfo,
				'smartshowauthorstyle' => Configuration::get('smartshowauthorstyle'),
				'smartshowauthor' => Configuration::get('smartshowauthor'),
				'limit' => isset($limit) ? $limit : 0,
				'limit_start' => isset($limit_start) ? $limit_start : 0 ,
				'c' => isset($c) ? $c : 1,
				'total' => $total,
				'smartakciiliststyle' => Configuration::get('smartakciiliststyle'),
				'smartcustomcss' => Configuration::get('smartcustomcss'),
				'smartshownoimg' => Configuration::get('smartshownoimg'),
				'smartdisablecatimg' => Configuration::get('smartdisablecatimg'),
				'smartshowviewed' => Configuration::get('smartshowviewed'),
				'post_per_page' => $posts_per_page,
				'pagenums' => $totalpages - 1,
				'totalpages' => $totalpages
			));

		$template_name  = 'postcategory.tpl';

		$this->setTemplate($template_name);        
	}
}