{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if !isset($content_only) || !$content_only}
					</div><!-- #center_column -->
					{if isset($right_column_size) && !empty($right_column_size)}
						<div id="right_column" class="col-xs-12 col-sm-{$right_column_size|intval} column">{$HOOK_RIGHT_COLUMN}</div>
					{/if}
					{if $page_name !='index' && $page_name !='pagenotfound'}
					</div><!-- .row -->
					{/if}
				</div><!-- #columns -->
				{if $page_name =='index' && $page_name !='pagenotfound'}
				<div class="home-bottom">
					<div class="container">{hook h="displayBottomHome"}</div>
				</div>
				{/if}
			</div><!-- .columns-container -->
			<div class="footer-section">
				 {if $page_name =='index' && $page_name !='pagenotfound'}
				<div class="top-footer">
					<div class="container">
						{hook h="displayTopFooter"}
					</div>
				</div>
				{/if}
				{if $page_name =='index' && $page_name !='pagenotfound'}
				<div class="blog-footer">
					<div class="container">
						{hook h="displayBlogFooter"}
					</div>
				</div>
				{/if}
				<div class="out-footer">
				{if isset($HOOK_FOOTER)}
					<!-- Footer -->
					<div class="footer-container">
						<footer id="footer"  class="container">
							<div class="row">
								<section class="footer-logo footer-block col-sm-2">
									<div class="block_content ">
										<a href="{if $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}" title="{$shop_name|escape:'html':'UTF-8'}">
											<img class="logo" src="{$logo_footer|escape:'html':'UTF-8'}" alt="{$shop_name|escape:'html':'UTF-8'}"/>
											
										</a>
									</div>
								</section>
								{$HOOK_FOOTER}
							</div>
						</footer>
					</div><!-- #footer -->
				{/if}
				<div class="footer-copyright">
					<div class="container">
						<div class="block-coppy-right">
						{hook h="displayCopyRight"}
						</div>
					</div>
				</div>
			</div>
			</div>
			{if $page_name == 'index'  && $page_name !='pagenotfound'}	
				{hook h="displayBannerSpecial"}		
			{/if}
		</div><!-- #page -->
{/if}
{include file="$tpl_dir./global.tpl"}
	</body>
</html>