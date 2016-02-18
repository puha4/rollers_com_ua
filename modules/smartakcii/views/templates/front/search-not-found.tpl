<div id="pagenotfound" class="row">
    <div class="center_column col-xs-12 col-sm-12" id="center_column">
        <div class="pagenotfound">
        
            <h1>{l s="Sorry, but nothing matched your search terms." mod="smartakcii"}</h1>
            
            <p> {l s="Please try again with some different keywords." mod="smartakcii"} </p>
            
            <form class="std" method="post" action="{smartakcii::GetSmartAkciiLink('smartakcii_search')}">
                <fieldset>
                    <div>
                        <input type="hidden" value="0" name="smartakciiaction">
                        <input type="text" class="form-control grey" value="{$smartsearch}" name="smartsearch" id="search_query">
                        <button class="btn btn-default btn-sm" value="OK" name="smartakciisubmit" type="submit"><span>{l s="Ok" mod="smartakcii"}</span></button>
                    </div>
                </fieldset>
            </form>
            <div class="buttons">
                <a title="Home" href="{smartakcii::GetSmartAkciiLink('smartakcii')}" class="btn btn-default btn-md icon-left"><span>{l s="Home page" mod="smartakcii"}</span></a>
            </div>
        </div>
    </div>
</div>
