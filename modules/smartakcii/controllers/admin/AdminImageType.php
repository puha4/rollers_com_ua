<?php
class AdminImageTypeController extends ModuleAdminController {

    public function __construct() {
        $this->table = 'smart_akcii_imagetype';
        $this->className = 'AkciiImageType';
        $this->module = 'smartakcii';
        $this->lang = false;
        $this->context = Context::getContext();
        $this->bootstrap = true;
        $this->fields_list = array(
                            'id_smart_akcii_imagetype' => array(
                                    'title' => $this->l('Id'),
                                    'width' => 100,
                                    'type' => 'text',
                            ),
                            'type_name' => array(
                                    'title' => $this->l('Type Name'),
                                    'width' => 350,
                                    'type' => 'text',
                            ),
                            'width' => array(
                                    'title' => $this->l('Width'),
                                    'width' => 60,
                                    'type' => 'text',
                            ),
                            'height' => array(
                                    'title' => $this->l('Height'),
                                    'width' => 60,
                                    'type' => 'text',
                            ),
                            'type' => array(
                                    'title' => $this->l('Type'),
                                    'width' => 220,
                                    'type' => 'text',
                            ),
                            'active' => array(
                                'title' => $this->l('Status'),
                                'width' => 60,
                                'align' => 'center',
                                'active' => 'status',
                                'type' => 'bool',
                                'orderby' => false
                            )
                    );
        parent::__construct();
    }

    public function renderForm()
            {
        $this->fields_form = array(
          'legend' => array(
          'title' => $this->l('Akcii Category'),
            ),
            'input' => array(
                array(
                    'type' => 'text',
                    'label' => $this->l('Image Type Name'),
                    'name' => 'type_name',
                    'size' => 60,
                    'required' => true,
                    'desc' => $this->l('Enter Your Image Type Name Here'),
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('width'),
                    'name' => 'width',
                    'size' => 15,
                    'required' => true,
                    'desc' => $this->l('Image height in px')
                ),
                array(
                    'type' => 'text',
                    'label' => $this->l('Height'),
                    'name' => 'height',
                    'size' => 15,
                    'required' => true,
                    'desc' => $this->l('Image height in px')
                ),
                                    array(
                                    'type' => 'select',
                                    'label' => $this->l('Type'),
                                    'name' => 'type',
                                    'required' => true,
                                    'options' => array(
                                    'query' => array(
                                                array(
                                                'id_option' => 'post',
                                                'name' => 'Post'
                                                ),
                                                array(
                                                'id_option' => 'Category',
                                                'name' => 'category'
                                                ),
                                                array(
                                                'id_option' => 'Author',
                                                'name' => 'author'
                                                )
                                            ),
                                    'id' => 'id_option',
                                    'name' => 'name'
                                    )
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
                                     )
            ),
            'submit' => array(
                'title' => $this->l('Save'),
                'class' => 'button btn btn-default'
            )
        );

        if (!($AkciiImageType = $this->loadObject(true)))
            return;

        $this->fields_form['submit'] = array(
            'title' => $this->l('Save   '),
            'class' => 'button btn btn-default'
        );
        return parent::renderForm();
    }
    public function renderList() {
        $this->addRowAction('edit');
        $this->addRowAction('delete');
        return parent::renderList();;
    }
    public function initToolbar() {
        parent::initToolbar();
    }
}