<!-- jQuery -->
<script>
	var mymap;
</script>
<script type="text/javascript" src="/js/core.min.js"></script>
<{*
<!-- Bootstrap Core JavaScript -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- jQuery fancybox -->
<script src="https://cdn.bootcss.com/fancybox/3.0.47/jquery.fancybox.min.js"></script>
*}>
<script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
  integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous">
 </script


<script src="//cdn.bootcss.com/socket.io/1.3.7/socket.io.js"></script>

<script type="text/javascript" src="/js/script.min.js"></script>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-cookies.min.js"></script>


<script type="text/javascript" src="/js/main.js"></script>

<{if $jsArray}>
	<{foreach from=$jsArray item=file}>
		<script src="js/<{$file}>"></script>
	<{/foreach}>
<{/if}>
<{include file="Frontend/js_var.tpl"}>
<div id="dialog" title="<{$language.website_alert_title}>">
  <p></p>
</div>

