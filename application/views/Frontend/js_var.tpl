<script>
	<{foreach from=$language_js_ary item=value key=k}>
	var <{$k}> ="<{$value}>"
	<{/foreach}>
	var fbAppId = "<{$fb_app_id}>";
	var  nav =new Array();
	nav['Home'] = '<{$language.nav_home}>';
	nav['Menu'] = '<{$language.nav_menu}>';
	nav['Contacts'] = '<{$language.nav_contact}>';
	nav['Login'] = '<{$language.nav_login}>';
</script>