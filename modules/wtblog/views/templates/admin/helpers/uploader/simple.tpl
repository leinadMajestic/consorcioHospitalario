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
{if isset($files) && $files|count > 0}
	{assign var='show_thumbnail' value=false}
	{foreach $files as $file}
		{if isset($file.image) && $file.type == 'image'}
			{assign var='show_thumbnail' value=true}
		{/if}
	{/foreach}
{if $show_thumbnail}
<div class="form-group">
	<div class="col-lg-12" id="{$id|intval}-images-thumbnails">
		{foreach $files as $file}
		{if isset($file.image) && $file.type == 'image'}
		<div class="img-thumbnail text-center col-lg-12">
			<p>{$file.image|escape:'quotes':'UTF-8'}</p>
			{if isset($file.size)}<p>{l s='File size' mod='wtblog'} {$file.size|escape:'htmlall':'UTF-8'}kb</p>{/if}
			{if isset($file.delete_url)}
			<p >
				<a class="btn btn-default" href="{$file.delete_url|escape:'htmlall':'UTF-8'}">
					<i class="icon-trash"></i> {l s='Delete' mod='wtblog'}
				</a>
			</p>
			{/if}
		</div>
		{/if}
		{/foreach}
	</div>
</div>
{/if}
{/if}
{if isset($max_files) && $files|count >= $max_files}
<div class="row">
	<div class="alert alert-warning">{l s='You have reached the limit (%s) of files to upload, please remove files to continue uploading' sprintf=$max_files  mod='wtblog'}</div>
</div>
{else}
<div class="form-group">
	<div class="col-lg-12">
		<input id="{$id|intval}" type="file" name="{$name|escape:'htmlall':'UTF-8'}"{if isset($multiple) && $multiple} multiple="multiple"{/if} class="hide" />
		<div class="dummyfile input-group">
			<span class="input-group-addon"><i class="icon-file"></i></span>
			<input id="{$id|intval}-name" type="text" name="filename" readonly />
			<span class="input-group-btn">
				<button id="{$id|intval}-selectbutton" type="button" name="submitAddAttachments" class="btn btn-default">
					<i class="icon-folder-open"></i> {if isset($multiple) && $multiple}{l s='Add files' mod='wtblog'}{else}{l s='Add file' mod='wtblog'}{/if}
				</button>
				
			</span>
		</div>
	</div>
</div>
<script type="text/javascript">
{if isset($multiple) && isset($max_files)}
	var {$id|intval}_max_files = {$max_files - $files|count};
{/if}

	$(document).ready(function(){
		$('#{$id|intval}-selectbutton').click(function(e) {
			$('#{$id|intval}').trigger('click');
		});

		$('#{$id|intval}-name').click(function(e) {
			$('#{$id|intval}').trigger('click');
		});

		$('#{$id|intval}-name').on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});

		$('#{$id|intval}-name').on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});

		$('#{$id|intval}-name').on('drop', function(e) {
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files;
			$('#{$id|intval}')[0].files = files;
			$(this).val(files[0].name);
		});

		$('#{$id|intval}').change(function(e) {
			if ($(this)[0].files !== undefined)
			{
				var files = $(this)[0].files;
				var name  = '';

				$.each(files, function(index, value) {
					name += value.name+', ';
				});

				$('#{$id|intval}-name').val(name.slice(0, -2));
			}
			else // Internet Explorer 9 Compatibility
			{
				var name = $(this).val().split(/[\\/]/);
				$('#{$id|intval}-name').val(name[name.length-1]);
			}
		});

		if (typeof {$id|escape:'quotes':'UTF-8'}_max_files !== 'undefined')
		{
			$('#{$id|intval}').closest('form').on('submit', function(e) {
				if ($('#{$id|intval}')[0].files.length > {$id|escape}_max_files) {
					e.preventDefault();
					alert('{l s='You can upload a maximum of %s files'|sprintf:$max_files  mod='wtblog'}');
				}
			});
		}
	});
</script>
{/if}