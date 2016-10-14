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

<h1 class="h_blog">{l s='Blog' mod='wtblog'}</h1>
<div class="rss">
<h1>{l s='RSS of blog' mod='wtblog'}</h1>
{if isset($rsss) && $rsss|@count > 0}
	<ul>
	{foreach from=$rsss item=rss}
	<li><a target="_blank" href="{$rss['link']|escape:'htmlall':'UTF-8'}">{$rss['name']|escape:'htmlall':'UTF-8'}</a> (<span><a href="{$rss['link']|escape:'htmlall':'UTF-8'}">{$rss['link']|escape:'htmlall':'UTF-8'}</a></span>) </li> <br/>
	{/foreach}
	</ul>
{/if}
</div>