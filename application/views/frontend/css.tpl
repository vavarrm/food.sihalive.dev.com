
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">

<{if $cssArray}>
	<{foreach from=$cssArray item=file}>
		<link rel="stylesheet" href="css/file">
	<{/foreach}>
<{/if}>
