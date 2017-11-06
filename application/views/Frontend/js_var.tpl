<script>
	<{foreach from=$language_js_ary item=value key=k}>
	var <{$k}> ="<{$value}>"
	<{/foreach}>
</script>