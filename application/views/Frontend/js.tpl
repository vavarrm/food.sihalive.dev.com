<!-- jQuery -->
<script>
	var mymap;
</script>
<script type="text/javascript" src="/js/core.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/script.min.js"></script>

<script src="//cdn.bootcss.com/socket.io/1.3.7/socket.io.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-cookies.min.js"></script>


<script type="text/javascript" src="/js/main.js"></script>


<{if $jsArray}>
	<{foreach from=$jsArray item=file}>
		<script src="/js/<{$file}>"></script>
	<{/foreach}>
<{/if}>
<{include file="Frontend/js_var.tpl"}>
<div id="dialog" title="<{$language.website_alert_title}>">
  <p></p>
</div>

