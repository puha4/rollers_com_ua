{capture name=path}
    <span class="navigation-page">
	<a href="{smartakcii::GetSmartAkciiLink('smartakcii')}">{l s='Все акции' mod='smartakcii'}</a>
    <span class="navigation-pipe">{$navigationPipe}</span>
    {$meta_title}
    </span>
{/capture}

<div itemtype="#" itemscope="" id="sdsakciiArticle" class="akcii-post">
	
    <h1 class="title_block_exclusive">{$meta_title}</h1>
    
    <div itemprop="articleBody">
    	{assign var="activeimgincat" value='0'}
    	{$activeimgincat = $smartshownoimg} 
    	
        {if ($post_img != "no" && $activeimgincat == 0) || $activeimgincat == 1}
    		<div class="post-image">
    			<img class="img-responsive" src="{$modules_dir}/smartakcii/images/{$post_img}-single-default.jpg" alt="{$meta_title}">
    		</div>
    	{/if}
    
    	<div class="sdsarticle-des">
    		{$content}
    	</div>
    
    	{if $tags != ''}
    		<div class="sdstags-update">
    			<span class="tags">
    				<b>{l s='Tags:' mod='smartakcii'} </b> 
    				{foreach from=$tags item=tag}
    					{assign var="options" value=null}
    					{$options.tag = $tag.name}
    					<a title="tag" href="{smartakcii::GetSmartAkciiLink('smartakcii_tag',$options)}">{$tag.name}</a>
    				{/foreach}
    			</span>
    		</div>
    	{/if}
    </div>
    
    <div class="articleHeader">
		<div class="postInfo">
			{assign var="catOptions" value=null}
            {$catOptions.id_category = $id_category}
            {$catOptions.slug = $cat_link_rewrite}

            {if $smartshowauthor ==1}
                
                {l s='Posted by ' mod='smartakcii'}
                <span itemprop="author">
                	<i class="fa fa-user"></i> 
            		{if $smartshowauthorstyle != 0}
                		{$firstname} {$lastname}
                    {else}
                    	{$lastname} {$firstname}
                    {/if}
                </span> 
			{/if}
			
            <span itemprop="dateCreated">
            	<i class="fa fa-calendar"></i>
                &nbsp;{$created|date_format}
            </span> 
                 
            <span itemprop="articleSection">
               <i class="fa fa-tags"></i>
               <a href="{smartakcii::GetSmartAkciiLink('smartakcii_category',$catOptions)}">{$title_category}</a>
            </span> 
             
            <span class="comments">   
                <i class="fa fa-comments"></i> 
                {if $countcomment != ''}
                    {$countcomment}
                {else}
                   0
                {/if}
                {l s=' Comments' mod='smartakcii'}
			</span>
            
        	<a title="" style="display:none" itemprop="url" href="#"></a>
		</div>
	</div>
    
	<div class="sdsarticleBottom">
    	{$HOOK_SMART_AKCII_POST_FOOTER}
	</div>
</div>

{if $countcomment != ''}
	<div id="articleComments" class="block">
    	<h2 class="title_block">{if $countcomment != ''}{$countcomment}{else}{l s='0' mod='smartakcii'}{/if}{l s=' Comments' mod='smartakcii'}</h2>
		<div id="comments">      
			<div class="commentList">
				{$i=1}
                {foreach from=$comments item=comment}
                	{include file="./comment_loop.tpl" childcommnets=$comment}
				{/foreach}
            </div>
        </div>
	</div>
{/if}

{if Configuration::get('smartenablecomment') == 1}
	{if $comment_status == 1}
		<div class="smartakciicomments" id="respond">
			<h4 class="comment-reply-title page-subheading" id="reply-title">{l s='Leave a Reply'  mod='smartakcii'} 
        		<small style="float:right;">
                	<a style="display: none;" href="#" id="cancel-comment-reply-link" rel="nofollow">{l s='Cancel Reply'  mod='smartakcii'}</a>
            	</small>
        	</h4>
		
        	<div id="commentInput">
            	<p><span class="required">{l s='All fields are required'  mod='smartakcii'}</span></p>
            	<form action="" method="post" id="commentform">
					<table>
						<tbody>
                        	<tr>
                            	<td> 
                                    <b>{l s='Name:'  mod='smartakcii'}</b>
                                </td>
                                <td>
                                	<input type="text" tabindex="1" class="inputName form-control grey" value="" name="name">
                                </td>
                            </tr>
                            <tr>
                            	<td>
                                    <b>{l s='E-mail:' mod='smartakcii'} </b>
                                    <span class="note">{l s='(Not Published)'  mod='smartakcii'}</span>
                                </td>
                                <td>
                                	<input type="text" tabindex="2" class="inputMail form-control grey" value="" name="mail">
                                </td>
                            </tr>
                            <tr>
                            	<td>
                                    <b> {l s='Comment:'  mod='smartakcii'}</b>
                                </td>
                                <td>
                                	<textarea tabindex="4" class="inputContent form-control grey" rows="8" cols="50" name="comment"></textarea>
                                </td>
                            </tr>
							{if Configuration::get('smartcaptchaoption') == '1'}
								<tr>
									<td> </td>
                                    <td><img src="{$modules_dir}smartakcii/classes/CaptchaSecurityImages.php?width=100&height=40&characters=5"></td>
								</tr>
                                <tr>
                                    <td>
                                        <b>{l s='Type Code' mod='smartakcii'}</b>
                                    </td>
                                    <td>
                                        <input type="text" tabindex="" value="" name="smartakciicaptcha" class="smartakciicaptcha form-control grey">
                                    </td>
								</tr>
							{/if}
						</tbody>
					</table>
					<input type='hidden' name='comment_post_ID' value='1478' id='comment_post_ID' />
					<input type='hidden' name='id_post' value='{$id_post}' id='id_post' />
					<input type='hidden' name='comment_parent' id='comment_parent' value='0' />
                    
					<div class="text-right">	
        				<div class="submit">
            				<input type="submit" name="addComment" id="submitComment" class="bbutton btn btn-default button-medium" value="{l s='Submit' mod='smartakcii'}">
						</div>
                    </div>
				</form>
		</div>
	</div>

	<script type="text/javascript">
		var error = "{l s='Warning: Please check required form bellow!' mod='smartakcii'}";
		var error_1 = "{l s='Name is required' mod='smartakcii'}";
		var error_2 = "{l s='Comment must be between 25 and 1500 characters!' mod='smartakcii'}";
		var error_3 = "{l s='E-mail address not valid!' mod='smartakcii'}";
		var error_4 = "{l s='Captcha is not valid' mod='smartakcii'}";
        $('#submitComment').bind('click',function(event) {
            event.preventDefault();
            var data = { 
                'action':'postcomment', 
                'id_post':$('input[name=\'id_post\']').val(),
                'comment_parent':$('input[name=\'comment_parent\']').val(),
                'name':$('input[name=\'name\']').val(),
                //'website':$('input[name=\'website\']').val(),
                'smartakciicaptcha':$('input[name=\'smartakciicaptcha\']').val(),
                'comment':$('textarea[name=\'comment\']').val(),
                'mail':$('input[name=\'mail\']').val()
            };
            
            $.ajax( {
                url: baseDir + 'modules/smartakcii/ajax.php',
                data: data, 
                dataType: 'json',
                beforeSend: function() {
                    $('.alert-warning, .alert-success, .alert-danger').remove();
                    $('#submitComment').attr('disabled', true);
                    $('#commentInput').before('<div class="attention"><img src="http://321cart.com/sellya/catalog/view/theme/default/image/loading.gif" alt="" />Please wait!</div>');
                },
                complete: function() {
                    $('#submitComment').attr('disabled', false);
                    $('.attention').remove();
                },
                success: function(json) {
                    
                    if (json['error']) {
                        $('#commentInput').before('<div class="alert alert-warning">' + '<i class="fa fa-warning"></i> '+error+'</div>');
                        $('.text-warning').each(function() {
                            $(this).text('')
                        });
                        if (json['error']['name']) {
                            $('.inputName').after('<span class="text-warning">' + error_1 + '</span>');
                        }
                        if (json['error']['mail']) {
                            $('.inputMail').after('<span class="text-warning">' + error_3 + '</span>');
                        }
                        if (json['error']['comment']) {
                            $('.inputContent').after('<span class="text-warning">' + error_2 + '</span>');
                        }
                        if (json['error']['captcha']) {
                            $('.smartakciicaptcha').after('<span class="text-warning">' + error_4 + '</span>');
                        }
                    }
                        
                    if (json['success']) {
                        $('input[name=\'name\']').val('');
                        $('input[name=\'mail\']').val('');
                        //$('input[name=\'website\']').val('');
                        $('textarea[name=\'comment\']').val('');
                        $('input[name=\'smartakciicaptcha\']').val('');
                        $('#commentInput').before('<div class="alert alert-success">' + json['success'] + '</div>');
                        setTimeout(function(){
                            $('.alert-success').fadeOut(300).delay(450).remove();
                            },2500
                        );
						location.reload();
                    }
                }
            });
        });
            
        var addComment = {
            moveForm : function(commId, parentId, respondId, postId) {
                var t = this, div, comm = t.I(commId), respond = t.I(respondId), cancel = t.I('cancel-comment-reply-link'), parent = t.I('comment_parent'), post = t.I('comment_post_ID');
    
                if ( ! comm || ! respond || ! cancel || ! parent )
                    return;
     
                t.respondId = respondId;
                postId = postId || false;
    
                if ( ! t.I('wp-temp-form-div') ) {
                    div = document.createElement('div');
                    div.id = 'wp-temp-form-div';
                    div.style.display = 'none';
                    respond.parentNode.insertBefore(div, respond);
                }
    
                comm.parentNode.insertBefore(respond, comm.nextSibling);
                if ( post && postId )
                    post.value = postId;
                    parent.value = parentId;
                    cancel.style.display = '';
    
                cancel.onclick = function() {
                    var t = addComment, temp = t.I('wp-temp-form-div'), respond = t.I(t.respondId);
    
                    if ( ! temp || ! respond )
                        return;
    
                    t.I('comment_parent').value = '0';
                    temp.parentNode.insertBefore(respond, temp);
                    temp.parentNode.removeChild(temp);
                    this.style.display = 'none';
                    this.onclick = null;
                    return false;
                };
    
                try { t.I('comment').focus(); }
                catch(e) {}
    
                return false;
            },
    
            I : function(e) {
                return document.getElementById(e);
            }
        };      
    </script>
    {/if}
{/if}

{if isset($smartcustomcss)}
    <style>
        {$smartcustomcss}
    </style>
{/if}
