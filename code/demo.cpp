/* from: ngx_http_waf_config.c */
char *
ngx_http_waf_merge_loc_conf(ngx_conf_t *cf, void *parent, void *child)
{
    ngx_http_waf_loc_conf_t *prev = parent; 
    ngx_http_waf_loc_conf_t *conf = child;
    ...
    // 合并 'waf_enabled' 标志
    ngx_conf_merge_value(conf->waf_enabled, prev->waf_enabled, 0);

    // 合并动态拦截启用标志
    ngx_conf_merge_value(conf->dynamic_block_enable, prev->dynamic_block_enable, 0);

    // 合并默认动作
    if (conf->default_action.type == WAF_ACTION_TYPE_UNSET) {
        if (prev->default_action.type != WAF_ACTION_TYPE_UNSET) {
            conf->default_action = prev->default_action;
        } else {
            // 如果父级也未设置，则应用最终的系统默认值
            conf->default_action.type = WAF_ACTION_TYPE_BLOCK_403; 
        }
    }
    ...
    return NGX_CONF_OK;
}
