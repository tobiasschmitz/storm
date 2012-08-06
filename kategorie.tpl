{if !$color && !$brand}
<!-- TITLE: {$title} -->
<!-- DESCRIPTION: {$description} -->
<!-- KEYWORDS: {$keywords} -->
{/if}

{literal}
    <script id="nscData">
    var nscData = {
      "meta" : { "totalProducts" : {/literal}"{$found_articles}"{literal} }
    }
    </script>
{/literal}

{assign var='file_hash' value='crc32'|@hash_file:'js/sports_neu/kategorie.js'}
    <script type="text/javascript" src="/js/sports_neu/kategorie.js?hash={$file_hash}" charset="utf-8"></script>
    <script type="text/javascript">
        var jsonCheckedFilters = {$jsonCheckedFilters};
        var sortName = '{$sortChecked}';
        var pageUrl = '{$SHOP_URL}{$path}';
    </script>

<div id="category_menu_container">
    {assign var=topmarke_menu_headerimg_abs value="/var/www/vhosts/engelhorn.de/html/images/layout_sports_neu/topmarke/`$markenshop`_menu.jpg"}
    {assign var=topmarke_menu_headerimg value="/images/layout_sports_neu/topmarke/`$markenshop`_menu.jpg"}
    {if $markenshop != "" && file_exists($topmarke_menu_headerimg_abs)}
        <div class="topmarke_menu_headerimg">
             <a href="/{$smarty.const.SHOP_MENU_GENDER}/marken/{$markenshop}/">
                 <img src="{$topmarke_menu_headerimg}" title="{$markenshop}" alt="{$markenshop}"/>
             </a>
        </div>
    {/if}
    <div id="category_menu_content_container">
        {load_content module='menu' params="type=side&serializeCheckedFilters=$serializeCheckedFilters"}
    </div>

    <div id="category_menu_filter_container">
        {include file='filter_side.tpl'}
    </div>

</div>

<div id="category_content_container">

    <div id="category_content_filter_container">
        {include file='filter_top.tpl'}
    </div>

    <div id="category_content_header_container">

        <div id="category_content_header">
            <h1>
                <strong>{$category.Text}</strong> ({if $found_articles != $total_articles}{$found_articles}/{/if}{$total_articles} Artikel)
            </h1>
        </div>

        <div class="clear"></div>

        <div id="category_content_header_sorting_container" class="category_content_sorting_container">
            {capture assign="sorting"}

            <div class="sorting_label">
                <strong>Sortierung</strong>
            </div>

            <div class="sorting_reset">
                {if $sortChecked != ''}
                <a href="javascript:void(0);" title="zurücksetzen">zurücksetzen</a>
                {/if}
            </div>

            <div class="sorting_content_container">

                <div class="sorting_content_display">
                    {if $sortChecked == ''}
                        Sortierung wählen
                    {else}
                        {$sortPossible[$sortChecked]}
                    {/if}
                </div>

                <div class="sorting_content_button">
                </div>

                <div class="sorting_content">
                    <ul>
                    {foreach from=$sortPossible key=optionKey item=optionValue}
                        <li{if $optionKey == $sortChecked} class="selected"{/if}>
                            <a title="{$optionValue}" rel="{$optionKey}">{$optionValue}</a>
                        </li>
                    {/foreach}
                    </ul>
                </div>

            </div>
        {/capture}
            {$sorting}
        </div>

        <div id="category_content_header_paging_amount_select_and_paging_container" class="category_content_paging_amount_select_and_paging_container">

            <div id="category_content_header_paging_amount_select_container" class="category_content_paging_amount_select_container">
            {capture assign="page_amount_selecting"}
                Artikel pro Seite: <a href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}seite-1-24">{if $articles_per_page == 24}<strong>24</strong>{else}24{/if}</a> | <a href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}seite-1-48">{if $articles_per_page == 48}<strong>48</strong>{else}48{/if}</a>
            {/capture}
                {$page_amount_selecting}
            </div>

            <div id="category_content_header_paging_container" class="category_content_paging_container">
            {capture assign="paging"}
            {strip}
                {if $page > 1}
                    <a href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}seite-1-{$articles_per_page}/" title="Erste Seite"></a>
                    <a href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}seite-{math equation = "x - 1" x = $page}-{$articles_per_page}" title="Vorherige Seite" rel="prev"></a>
                {else}
                    <a title="Erste Seite"></a>
                    <a title="Vorherige Seite"></a>
                {/if}

            {foreach from=$pages item='page_no' name='page_nos'}
                {if $page_no != '...'}
                    <a href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}seite-{$page_no}-{$articles_per_page}/" title="Seite {$page_no}"{if $page_no == $page} class="active_page"{/if}>{$page_no}</a>
                {else}
                    <a title="...">...</a>
                {/if}
            {/foreach}

                {if $page < $pages_count}
                    <a href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}seite-{math equation = "x + 1" x = $page}-{$articles_per_page}" title="Nächste Seite" rel="next"></a>
                    <a href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}seite-{$pages_count}-{$articles_per_page}/" title="Letzte Seite"></a>
                {else}
                    <a title="Nächste Seite"></a>
                    <a title="Letzte Seite"></a>
                {/if}
            {/strip}
            {/capture}
                {$paging}
            </div>

        </div>

        <div class="clear"></div>

    </div>

    <div id="category_content">
        {if $articles|@count > 0}
            {foreach from=$articles item='a' name='prods'}
            {assign var="hauptfarbe" value=$a.Hauptfarbe}
            <div class="product_container{if (($smarty.foreach.prods.iteration -1) % 3) == 0} clear{/if}">
                <div class="product">

                    <div class="product_image_container" id="product_image_container_{$a.ArtikelId}">
                        <a href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}{$a.NameForPath}--{$menu}--{$a.ArtikelId}--{$a.Hauptfarbe}/{if $a.SetID && $smarty.get.setstep > 0}set-{$a.SetID}-{$smarty.get.setstep}/{elseif ($a.SetID && isset($smarty.get.setstep))}setstep-0/{/if}" title='{$a.Name|replace:"'":""|regex_replace:"(<br>|<br />)":" - "}'>
                            <img id="product_image_a_{$a.ArtikelId}" width="{$a.Farben[$hauptfarbe].ADetail.Breite}" height="{$a.Farben[$hauptfarbe].ADetail.Hoehe}" src="{$imageDomain}/images/product_images/{$a.Farben[$hauptfarbe].ADetail.Dateiname}" alt='{$a.Name|replace:"'":""|regex_replace:"(<br>|<br />)":" - "}' />
                            <img id="product_image_b_{$a.ArtikelId}" width="{$a.Farben[$hauptfarbe].BDetail.Breite}" height="{$a.Farben[$hauptfarbe].BDetail.Hoehe}" src="{$imageDomain}/images/product_images/{$a.Farben[$hauptfarbe].BDetail.Dateiname}" alt='{$a.Name|replace:"'":""|regex_replace:"(<br>|<br />)":" - "}' style="display: none;" />
                        </a>
                    </div>

                    <div class="product_color_container">

                        <div class="product_brand_logo_container">
                            <img class="product_brand_logo" src="{$imageDomain}/images/brands/kategorie/{$a.MarkeDateiname}.gif" alt="{$a.Marke}" />
                        </div>


                    {foreach from=$a.verfuegbar key='farbe' item='ff'}<a id="product_sizes_{$a.ArtikelId}_{$farbe}" href="{$SHOP_URL}{$path}{if $smarty.get.filter}{$smarty.get.filter}/{/if}{$a.NameForPath}--{$menu}--{$a.ArtikelId}--{$farbe}/{if $a.SetID && $smarty.get.setstep > 0}set-{$a.SetID}-{$smarty.get.setstep}/{elseif ($a.SetID && isset($smarty.get.setstep))}setstep-0/{/if}" class="product_color_link {foreach from=$a.groessen item='groesse'}{if $ff[$groesse]}size_{$groesse} {/if}{if !$ff[$groesse]}size_not_available_{$groesse} {/if}{/foreach}" title="{$a.Farben.$farbe.FarbText}"><img src="{$imageDomain}/images/product_images/{$ff.FarbIcon}" width="13" height="13" alt="{$a.Farben.$farbe.FarbText}" /></a>{/foreach}

                    {*if $a.SetID > 0 && $a.SetPos == 0}
                        <img class="product_set_teaser" src="/images/layout_fashion/standard/btn_als_set_erhaeltlich.jpg" width="99" height="15" alt="Als Set erhältlich" title="Als Set erhältlich" />
                    {/if*}
                    </div>


                    <div class="product_name_price_container">
                        <div class="product_name_container">
                            <strong>{$a.Marke}</strong>
                            <br />
                            {$a.Name|truncate:40}
                        </div>

                        <div class="product_price_container">
                            {if floatval($a.MinVKPreis) >= floatval($a.MinOVKPreis)}
                                <span class="amount">
                                    {if floatval($a.MinVKPreis) < floatval($a.MaxVKPreis)}ab {/if}{$a.MinVKPreis|number_format:2:',':'.'}{*|replace:",00":",-"*} &euro;
                                </span>
                            {else}
                                <span class="amount red">{if floatval($a.MinVKPreis) < floatval($a.MaxVKPreis)}ab {/if}{$a.MinVKPreis|number_format:2:',':'.'}{*|replace:",00":",-"*} &euro;</span><span class="amount strike">{$a.MinOVKPreis|number_format:2:',':'.'|replace:",00":",-"} &euro;</span>
                            {/if}
                        </div>

                    </div>


                    {if $a.Aufdruck == 'ja'}
                        <div class="product_stoerer_1">
                            <a class="product_stoerer_flock" href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}{$a.NameForPath}--{$menu}--{$a.ArtikelId}--{$a.Hauptfarbe}/{if $a.SetID && $smarty.get.setstep > 0}set-{$a.SetID}-{$smarty.get.setstep}/{elseif ($a.SetID && isset($smarty.get.setstep))}setstep-0/{/if}" class="stoerer_set" title="{$a.Name}">Flock</a>
                        </div>
                    {/if}

                    {if $a.SetPos == 0 && $a.SetPos != ''}
                        <div class="product_stoerer_2">
                            <a class="product_stoerer_set" href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}{$a.NameForPath}--{$menu}--{$a.ArtikelId}--{$a.Hauptfarbe}/{if $a.SetID && $smarty.get.setstep > 0}set-{$a.SetID}-{$smarty.get.setstep}/{elseif ($a.SetID && isset($smarty.get.setstep))}setstep-0/{/if}" class="stoerer_flock" title="{$a.Name}">SET</a>
                        </div>
                    {/if}


                    {* Falls Artikel neu und reduziert sind, wird nur der Störer Neu auf der "NEU-Produktübersicht" angezeigt  11.06.12 *}
                    {if preg_match('@/neu/@',$smarty.server.REQUEST_URI)}
                            {if $a.NeuTS == 1 && $a.Aufdruck != 'ja'}
                            <div class="product_stoerer_1">
                                <a class="product_stoerer_neu" href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}{$a.NameForPath}--{$menu}--{$a.ArtikelId}--{$a.Hauptfarbe}/{if $a.SetID && $smarty.get.setstep > 0}set-{$a.SetID}-{$smarty.get.setstep}/{elseif ($a.SetID && isset($smarty.get.setstep))}setstep-0/{/if}" class="stoerer_neu" title="{$a.Name}">Neu</a>
                            </div>
                        {/if}
                    {else}
                        {if $a.RabattProzent && $a.Aufdruck != 'ja'}
                            {math equation="100-(100/ovk * vk)" vk=$a.MinVKPreis ovk=$a.MinOVKPreis assign="reduce"}
                            <div class="product_stoerer_1">
                                <a class="product_stoerer_prozent" href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}{$a.NameForPath}--{$menu}--{$a.ArtikelId}--{$a.Hauptfarbe}/{if $a.SetID && $smarty.get.setstep > 0}set-{$a.SetID}-{$smarty.get.setstep}/{elseif ($a.SetID && isset($smarty.get.setstep))}setstep-0/{/if}" class="stoerer_prozent" title="{$a.Name}">-{$reduce|ceil}%</a>
                            </div>
                            {/if}

                            {if $a.NeuTS == 1 && !$a.RabattProzent && $a.Aufdruck != 'ja'}
                            <div class="product_stoerer_1">
                                <a class="product_stoerer_neu" href="{$SHOP_URL}{$path}{if $smarty.get.sort}sortierung--{$smarty.get.sort}/{/if}{if $smarty.get.filter}{$smarty.get.filter}/{/if}{$a.NameForPath}--{$menu}--{$a.ArtikelId}--{$a.Hauptfarbe}/{if $a.SetID && $smarty.get.setstep > 0}set-{$a.SetID}-{$smarty.get.setstep}/{elseif ($a.SetID && isset($smarty.get.setstep))}setstep-0/{/if}" class="stoerer_neu" title="{$a.Name}">Neu</a>
                            </div>
                        {/if}
                    {/if}
                    {************************************************************************************************************************}

                    <div class="product_sizes_container">
                        <div class="product_sizes">
                            <strong>Verfügbare Größen</strong>
                            <div class="product_sizes_content"></div>
                            <div class="clear"></div>
                        </div>
                    </div>

                </div>
            </div>
            {/foreach}
        {else}
            <span class="bold" id="keineprodukte">Derzeit sind leider in dieser Kategorie keine Produkte vorhanden. Bitte wählen Sie eine andere Kategorie.</span>
        {/if}
    </div>

    <div id="category_content_footer_container">

        <div id="category_content_footer_sorting_container" class="category_content_sorting_container">
            {$sorting}
        </div>

        <div id="category_content_footer_paging_amount_select_and_paging_container" class="category_content_paging_amount_select_and_paging_container">

            <div id="category_content_footer_paging_amount_select_container" class="category_content_paging_amount_select_container">
                {$page_amount_selecting}
            </div>

            <div id="category_content_footer_paging_container" class="category_content_paging_container">
                {$paging}
            </div>

        </div>

        <div class="clear"></div>

    </div>

    <div class="clear"></div>

</div>

<div class="clear"></div>

<script type="text/javascript">
    var criteo_item_id_1 = '';
    var criteo_item_id_2 = '';
    var criteo_item_id_3 = '';
    {foreach from=$articles item='a' name='prods2'}
        {if $smarty.foreach.prods2.iteration <= 3}
            criteo_item_id_{$smarty.foreach.prods2.iteration} = '{$a.Artikelnummer}-{$a.Hauptfarbe}';
        {/if}
    {/foreach}
</script>

{include file='webtrekk_basic.tpl'}
