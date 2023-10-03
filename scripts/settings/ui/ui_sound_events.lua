local ui_sound_events = {
	character_create_planet_select = "wwise/events/ui/play_ui_character_create_select_planet",
	mission_objective_popup_new = "wwise/events/ui/play_hud_new_objective",
	end_screen_summary_reward_in_rarity_3 = "wwise/events/ui/play_ui_eor_item_granted_tier_2",
	end_screen_item_drop_card_expand = "wwise/events/ui/play_ui_eor_card_expand",
	weapons_discard_hold = "wwise/events/ui/play_ui_character_loadout_discard_weapon_hold",
	social_menu_initiate_kick_vote = "wwise/events/ui/play_ui_click",
	talent_last_point_spent = "wwise/events/ui/play_ui_talents_last_point_spent",
	talent_node_hover_default = "wwise/events/ui/play_ui_mouseover",
	tutorial_popup_enter = "wwise/events/ui/play_ui_popup_open",
	news_popup_exit = "wwise/events/ui/play_ui_popup_close",
	talent_node_select_keystone = "wwise/events/ui/play_ui_talents_keystone_select",
	system_menu_exit = "wwise/events/ui/play_ui_back",
	item_result_overlay_reward_in_rarity_2 = "wwise/events/ui/play_ui_item_result_ovelay_tier_1",
	mission_lobby_player_ready = "wwise/events/ui/play_ui_mission_lobby_players_rdy",
	social_menu_popup_button_pressed = "wwise/events/ui/play_ui_click",
	mission_vote_popup_decline = "wwise/events/ui/play_ui_mission_request_declined",
	crafting_view_on_fuse_traits = "wwise/events/ui/play_ui_npc_interacts_forge_fuse_traits",
	notification_item_received_rarity_1 = "wwise/events/ui/play_hud_notifications_item_tier_1",
	mission_lobby_player_unready = "wwise/events/ui/play_ui_mission_lobby_players_unrdy",
	mission_lobby_abort = "wwise/events/ui/play_ui_back",
	character_create_enter = "wwise/events/ui/play_ui_character_create_enter",
	credits_vendor_on_purchase = "wwise/events/ui/play_ui_stores_shared_buy",
	character_create_hide_details = "wwise/events/ui/play_ui_silence",
	mark_vendor_on_exit = "wwise/events/ui/play_ui_npc_interacts_default_exit",
	character_create_toggle_class_description = "wwise/events/ui/play_ui_character_create_toggle_class_description",
	character_appearence_confirm = "wwise/events/ui/play_ui_enter_short_plus_click",
	crafting_view_on_enter = "wwise/events/ui/play_ui_npc_interacts_forge_enter",
	tab_secondary_button_hovered = "wwise/events/ui/play_ui_mouseover",
	weapons_customize_enter = "wwise/events/ui/play_ui_enter_short",
	apparel_exit = "wwise/events/ui/play_ui_back_short",
	end_screen_level_up_card_expand = "wwise/events/ui/play_ui_eor_card_expand",
	mission_objective_popup_part_complete = "wwise/events/ui/play_hud_objective_part_done",
	character_create_abort = "wwise/events/ui/play_ui_back_short",
	social_menu_cancel_invite = "wwise/events/ui/play_ui_click",
	credits_vendor_on_enter = "wwise/events/ui/play_ui_npc_interacts_credits_vendor_enter",
	character_create_class_confirm = "wwise/events/ui/play_ui_character_create_class_confirm",
	news_popup_enter = "wwise/events/ui/play_ui_popup_open",
	social_menu_unmute_player_text = "wwise/events/ui/play_ui_social_unblock",
	weapons_exit = "wwise/events/ui/play_ui_back_short",
	weapons_swap = "wwise/events/ui/play_ui_gear_whoosh_small",
	notification_trait_received_rarity_1 = "wwise/events/ui/play_hud_notifications_default_enter",
	end_screen_enter = "wwise/events/ui/play_ui_eor_start_stinger",
	aquilas_vendor_on_exit = "wwise/events/ui/play_ui_npc_interacts_default_exit",
	options_slider_music_click = "wwise/events/ui/play_ui_click",
	character_create_archetype_zealot = "wwise/events/ui/play_ui_zealot_amb",
	end_screen_summary_reward_in_rarity_4 = "wwise/events/ui/play_ui_eor_item_granted_tier_2",
	news_feed_slide_enter = "wwise/events/ui/play_ui_popup_open",
	options_slider_vo_release = "wwise/events/ui/play_ui_click",
	delete_character_confirm = "wwise/events/ui/play_ui_character_select_delete_character",
	notification_player_leave_party = "wwise/events/ui/play_hud_player_leave_party",
	social_menu_block_player = "wwise/events/ui/play_ui_social_block",
	end_screen_summary_diamantine_zero = "wwise/events/ui/play_ui_eor_currency_credits_0",
	item_result_overlay_reward_in_rarity_6 = "wwise/events/ui/play_ui_item_result_ovelay_tier_3",
	tutorial_popup_slide_previous = "wwise/events/ui/play_ui_click",
	weapons_enter = "wwise/events/ui/play_ui_enter_short",
	cosmetics_vendor_on_exit = "wwise/events/ui/play_ui_npc_interacts_default_exit",
	options_slider_sfx_release = "wwise/events/ui/play_ui_click",
	end_screen_summary_reward_in_rarity_6 = "wwise/events/ui/play_ui_eor_item_granted_tier_3",
	crafting_view_on_reroll_perk = "wwise/events/ui/play_ui_npc_interacts_forge_reroll_perk",
	tutorial_popup_exit = "wwise/events/ui/play_ui_back_short",
	mission_board_hide_icon = "wwise/events/ui/play_ui_mission_board_node_disappear",
	main_menu_enter = "wwise/events/ui/play_ui_character_select_ambience",
	mission_briefing_start = "wwise/events/ui/play_amb_valkyrie_interior",
	weapons_discard_release = "wwise/events/ui/stop_ui_character_loadout_discard_weapon_hold",
	crafting_view_on_upgrade_item = "wwise/events/ui/play_ui_npc_interacts_forge_upgrade_item",
	apparel_enter = "wwise/events/ui/play_ui_click",
	notification_player_join_party = "wwise/events/ui/play_hud_player_join_party",
	tutorial_popup_slide_next = "wwise/events/ui/play_ui_click",
	end_screen_summary_experience_zero = "wwise/events/ui/play_ui_eor_xp_0",
	mission_vote_popup_hide_details = "wwise/events/ui/play_ui_hide_details",
	system_popup_enter = "wwise/events/ui/play_ui_popup_open",
	mission_board_enter = "wwise/events/ui/play_ui_mission_board_enter",
	character_create_archetype_psyker = "wwise/events/ui/play_ui_psyker_amb",
	options_slider_voip_click = "wwise/events/ui/play_ui_click",
	mission_briefing_stop = "wwise/events/ui/stop_amb_valkyrie_interior",
	end_screen_summary_xp_bar_stop = "wwise/events/ui/stop_ui_xp_bar",
	character_create_archetype_veteran = "wwise/events/ui/play_ui_veteran_amb",
	options_slider_master_drag = "wwise/events/ui/play_ui_slider_drag_master",
	apparel_zoom_in = "wwise/events/ui/play_ui_character_loadout_cosmetics_zoom_in",
	notification_item_received_rarity_4 = "wwise/events/ui/play_hud_notifications_item_tier_2",
	weapons_skin_select = "wwise/events/ui/play_ui_character_loadout_weapon_skin_swap",
	end_screen_summary_experience_start = "wwise/events/ui/play_ui_xp_count",
	summary_popup_enter = "wwise/events/ui/play_ui_enter_short",
	social_menu_unmute_player_voice = "wwise/events/ui/play_ui_social_unblock",
	end_screen_summary_plasteel_stop = "wwise/events/ui/play_ui_eor_currency_credits_stop",
	end_screen_summary_plasteel_zero = "wwise/events/ui/play_ui_eor_currency_credits_0",
	main_menu_start_button_hover_enter = "wwise/events/ui/play_ui_abilities_mouseover_specialization",
	end_screen_summary_diamantine_start = "wwise/events/ui/play_ui_eor_currency_credits_start",
	end_screen_summary_experience_stop = "wwise/events/ui/stop_ui_xp_count",
	social_menu_cycle_sort_method = "wwise/events/ui/play_ui_click",
	apparel_equip_frame = "wwise/events/ui/play_ui_character_loadout_equip_frame",
	default_slider_drag = "wwise/events/ui/play_ui_silence",
	notification_trait_received_rarity_3 = "wwise/events/ui/play_hud_notifications_default_enter",
	notification_join_party_failed = "wwise/events/ui/play_ui_mission_request_declined",
	notification_matchmaking_failed = "wwise/events/ui/play_ui_mission_request_declined",
	interaction_view_internal_back = "wwise/events/ui/play_ui_back_short",
	apparel_equip_small = "wwise/events/ui/play_ui_character_loadout_equip_armor_small",
	crafting_view_on_extract_trait = "wwise/events/ui/play_ui_npc_interacts_forge_extract_trait",
	main_menu_start_button_hover_leave = "wwise/events/ui/play_ui_abilities_mouseover_ability_group",
	notification_item_received_rarity_6 = "wwise/events/ui/play_hud_notifications_item_tier_3",
	news_feed_slide_exit = "wwise/events/ui/play_ui_popup_close",
	interact_popup_exit = "wwise/events/ui/play_hud_interaction_popup_exit",
	smart_tag_location_attention_enter_others = "wwise/events/ui/play_smart_tag_location_default_enter_others",
	smart_tag_location_default_enter_others = "wwise/events/ui/play_smart_tag_location_default_enter_others",
	tab_secondary_button_pressed = "wwise/events/ui/play_ui_tab2",
	smart_tag_location_threat_enter = "wwise/events/ui/play_smart_tag_location_threat_enter",
	smart_tag_location_threat_enter_others = "wwise/events/ui/play_smart_tag_location_threat_enter_others",
	interaction_view_internal_enter = "wwise/events/ui/play_ui_enter_short",
	emote_wheel_entry_hover = "wwise/events/ui/play_ui_mouseover",
	emote_wheel_open = "wwise/events/ui/play_hud_tag_emote_wheel_open",
	rumble_enabled = "wwise/events/ui/play_ui_rumble",
	apparel_select = "wwise/events/ui/play_ui_click",
	end_screen_summary_xp_bar_start = "wwise/events/ui/play_ui_xp_bar",
	notification_currency_recieved = "wwise/events/ui/play_hud_notifications_credits_received",
	prologue_tutorial_message_exit = "wwise/events/ui/play_hud_tutorial_popup_exit",
	main_menu_start_game = "wwise/events/ui/play_ui_character_select_start_game",
	add_profile_preset = "wwise/events/ui/play_ui_click",
	social_menu_popup_exit = "wwise/events/ui/play_ui_popup_close",
	end_screen_summary_card_slide_left = "wwise/events/ui/play_ui_eor_card_slide",
	character_create_show_details = "wwise/events/ui/play_ui_silence",
	title_screen_continue = "wwise/events/ui/play_ui_press_key_to_continue",
	smart_tag_pickup_default_enter_others = "wwise/events/ui/play_smart_tag_location_default_enter_others",
	main_menu_select_character = "wwise/events/ui/play_ui_character_select_select",
	end_screen_summary_plasteel_progress = "ui_xp_progress",
	options_slider_master_click = "wwise/events/ui/play_ui_click",
	talent_node_select_default = "wwise/events/ui/play_ui_talents_default_select",
	end_screen_summary_currency_icon_out = "wwise/events/ui/play_ui_eor_icon_out",
	mission_vote_player_declined = "wwise/events/ui/play_ui_mission_request_declined",
	smart_tag_hud_default = "wwise/events/ui/play_smart_tag_2d_default",
	cosmetics_vendor_show_with_gear = "wwise/events/ui/play_ui_gear_whoosh_small",
	end_screen_summary_reward_in_rarity_1 = "wwise/events/ui/play_ui_eor_item_granted_tier_1",
	end_screen_summary_credits_progress = "ui_xp_progress",
	news_popup_slide_next = "wwise/events/ui/play_ui_click",
	social_menu_leave_party = "wwise/events/ui/play_hud_player_leave_party",
	notification_item_received_rarity_2 = "wwise/events/ui/play_hud_notifications_item_tier_1",
	end_screen_summary_xp_bar_progress = "ui_xp_progress",
	system_menu_enter = "wwise/events/ui/play_ui_enter",
	default_menu_exit = "wwise/events/ui/play_ui_back_short",
	end_screen_exit = "wwise/events/ui/stop_ui_eor_stop_all_loops",
	smart_tag_location_attention_enter = "wwise/events/ui/play_smart_tag_location_default_enter",
	talent_node_select_ability = "wwise/events/ui/play_ui_talents_ability_select",
	main_menu_exit = "wwise/events/ui/stop_ui_character_select_ambience",
	character_create_class_select = "wwise/events/ui/play_ui_character_create_select_class",
	item_result_overlay_reward_in_rarity_4 = "wwise/events/ui/play_ui_item_result_ovelay_tier_2",
	barber_chirurgeon_on_enter = "wwise/events/ui/play_ui_npc_interacts_barber_chirurgeon_enter",
	default_menu_enter = "wwise/events/ui/play_ui_enter_short",
	weapons_equip_gadget = "wwise/events/ui/play_ui_character_loadout_equip_frame",
	tab_button_pressed = "wwise/events/ui/play_ui_tab",
	social_menu_friend_request_accept = "wwise/events/ui/play_ui_click",
	end_screen_summary_level_up = "wwise/events/ui/play_ui_eor_character_lvl_up",
	notification_cosmetic_received = "wwise/events/ui/play_hud_notifications_item_tier_3",
	mission_board_exit = "wwise/events/ui/play_ui_mission_board_exit",
	credits_vendor_on_exit = "wwise/events/ui/play_ui_npc_interacts_default_exit",
	end_screen_summary_talents_unlocked = "wwise/events/ui/play_ui_eor_new_talents",
	weapons_skin_confirm = "wwise/events/ui/play_ui_character_loadout_equip_frame",
	social_menu_mute_player_voice = "wwise/events/ui/play_ui_social_block",
	finalize_creation_confirm = "wwise/events/ui/play_ui_character_create_confirm_create_character",
	mission_vote_popup_show_details = "wwise/events/ui/play_ui_show_details",
	social_menu_unblock_player = "wwise/events/ui/play_ui_social_unblock",
	apparel_zoom_out = "wwise/events/ui/play_ui_character_loadout_cosmetics_zoom_out",
	talent_node_click = "wwise/events/ui/play_ui_click",
	summary_popup_exit = "wwise/events/ui/play_ui_back_short",
	talent_node_add_point = "wwise/events/ui/play_ui_talents_add_point",
	social_menu_see_player_profile = "wwise/events/ui/play_ui_click",
	onboarding_popup_message_exit = "wwise/events/ui/play_hud_tutorial_popup_exit",
	switch_profile_preset = "wwise/events/ui/play_ui_character_swap_preset",
	item_result_overlay_reward_in_rarity_3 = "wwise/events/ui/play_ui_item_result_ovelay_tier_2",
	news_popup_slide_previous = "wwise/events/ui/play_ui_click",
	item_result_overlay_reward_in_rarity_5 = "wwise/events/ui/play_ui_item_result_ovelay_tier_3",
	options_slider_sfx_drag = "wwise/events/ui/play_ui_slider_drag_sfx",
	social_menu_popup_enter = "wwise/events/ui/play_ui_popup_open",
	apparel_equip = "wwise/events/ui/play_ui_character_loadout_equip_armor",
	prologue_tutorial_message_enter = "wwise/events/ui/play_hud_tutorial_popup_enter",
	character_create_exit = "wwise/events/ui/play_ui_character_create_exit",
	default_dropdown_minimize = "wwise/events/ui/play_ui_dropdown_minimize",
	end_screen_summary_plasteel_start = "wwise/events/ui/play_ui_eor_currency_credits_start",
	notification_warning = "wwise/events/ui/play_hud_notifications_warning",
	talent_node_line_connection_stop = "wwise/events/ui/stop_ui_talents_line",
	weapons_trinket_select = "wwise/events/ui/play_ui_character_loadout_weapon_skin_swap",
	cosmetics_vendor_on_enter = "wwise/events/ui/play_ui_npc_interacts_cosmetics_vendor_enter",
	title_screen_exit = "wwise/events/ui/play_ui_silence",
	options_slider_voip_release = "wwise/events/ui/play_ui_click",
	end_screen_summary_credits_start = "wwise/events/ui/play_ui_eor_currency_credits_start",
	smart_tag_location_default_enter = "wwise/events/ui/play_smart_tag_location_default_enter",
	default_mouse_hover = "wwise/events/ui/play_ui_mouseover",
	weapons_customize_exit = "wwise/events/ui/play_ui_back_short",
	barber_chirurgeon_on_exit = "wwise/events/ui/play_ui_npc_interacts_default_exit",
	mark_vendor_on_purchase = "wwise/events/ui/play_ui_stores_shared_buy",
	crafting_view_on_replace_trait = "wwise/events/ui/play_ui_npc_interacts_forge_replace_trait",
	mark_vendor_replace_contract = "wwise/events/ui/play_ui_npc_interacts_marks_vendor_replace_contract",
	social_menu_mute_player_text = "wwise/events/ui/play_ui_social_block",
	social_menu_popup_button_hovered = "wwise/events/ui/play_ui_mouseover",
	mission_board_receiving_soon = "wwise/events/ui/play_ui_mission_board_countdown",
	emote_wheel_entry_select = "wwise/events/ui/play_ui_click",
	character_create_archetype_confirm = "wwise/events/ui/play_ui_character_create_archetype_confirm",
	mission_board_show_icon = "wwise/events/ui/play_ui_mission_board_node_appear",
	character_create_archetype_pressed = "wwise/events/ui/play_ui_character_create_select_archetype",
	interact_popup_enter = "wwise/events/ui/play_hud_interaction_popup_enter",
	end_screen_summary_reward_in_rarity_5 = "wwise/events/ui/play_ui_eor_item_granted_tier_3",
	mark_vendor_on_enter = "wwise/events/ui/play_ui_npc_interacts_marks_vendor_enter",
	notification_item_received_rarity_5 = "wwise/events/ui/play_hud_notifications_item_tier_3",
	crafting_view_on_exit = "wwise/events/ui/play_ui_npc_interacts_default_exit",
	talent_node_select_aura = "wwise/events/ui/play_ui_talents_aura_select",
	talent_menu_exit = "wwise/events/ui/play_ui_silence",
	mission_lobby_ready_up = "wwise/events/ui/play_ui_mission_lobby_ready_up",
	talent_node_select_tactical = "wwise/events/ui/play_ui_talents_tactical_select",
	item_result_overlay_reward_in_rarity_1 = "wwise/events/ui/play_ui_item_result_ovelay_tier_1",
	default_button_pressed = "wwise/events/ui/play_ui_click",
	end_screen_summary_experience_progress = "ui_xp_progress",
	mission_lobby_unready = "wwise/events/ui/play_ui_mission_lobby_player_unready",
	mission_board_node_pressed = "wwise/events/ui/play_ui_mission_board_node_click",
	end_screen_summary_currency_icon_in = "wwise/events/ui/play_ui_eor_icon_in",
	options_slider_sfx_click = "wwise/events/ui/play_ui_click",
	ability_off_cooldown = "wwise/events/ui/play_hud_ability_off_cooldown",
	weapons_discard_complete = "wwise/events/ui/play_ui_character_loadout_discard_weapon_complete",
	social_menu_cancel_friend_request = "wwise/events/ui/play_ui_click",
	emote_wheel_close = "wwise/events/ui/play_hud_tag_emote_wheel_close",
	default_click = "wwise/events/ui/play_ui_click",
	mission_board_start_mission = "wwise/events/ui/play_ui_mission_request_accept",
	character_appearance_change = "wwise/events/ui/play_ui_character_create_appearance_change",
	character_appearence_stop_voice_preview = "wwise/events/vo/stop_voice_preview",
	aquilas_vendor_purchase_aquilas = "wwise/events/ui/play_ui_npc_interacts_premium_vendor_purchase_aquilas",
	weapons_select_weapon = "wwise/events/ui/play_ui_click",
	talent_node_clear_all = "wwise/events/ui/play_ui_talents_clear_all",
	aquilas_vendor_on_enter = "wwise/events/ui/play_ui_npc_interacts_premium_vendor_enter",
	character_create_archetype_ogryn = "wwise/events/ui/play_ui_ogryn_amb",
	talent_node_select_stat = "wwise/events/ui/play_ui_talents_stat_select",
	mission_objective_popup_complete = "wwise/events/ui/play_hud_objective_complete",
	aquilas_vendor_on_purchase = "wwise/events/ui/play_ui_stores_shared_buy",
	end_screen_summary_reward_in_rarity_2 = "wwise/events/ui/play_ui_eor_item_granted_tier_1",
	options_slider_music_drag = "wwise/events/ui/play_ui_slider_drag_music",
	notification_trait_received_rarity_2 = "wwise/events/ui/play_hud_notifications_default_enter",
	talents_talent_hover = "wwise/events/ui/play_ui_feats_talent_hover",
	end_screen_summary_diamantine_stop = "wwise/events/ui/play_ui_eor_currency_credits_stop",
	notification_item_received_rarity_3 = "wwise/events/ui/play_hud_notifications_item_tier_2",
	smart_tag_pickup_default_enter = "wwise/events/ui/play_smart_tag_location_default_enter",
	options_slider_voip_drag = "wwise/events/ui/play_ui_slider_drag_voip",
	social_menu_receive_invite = "wwise/events/ui/play_ui_social_receive",
	default_button_hovered = "wwise/events/ui/play_ui_mouseover",
	onboarding_popup_message_enter = "wwise/events/ui/play_hud_tutorial_popup_enter",
	mission_vote_popup_accept = "wwise/events/ui/play_ui_mission_request_accept",
	crafting_craft_button_deactivation = "wwise/events/ui/play_ui_silence",
	mission_lobby_matchmade_players_join = "wwise/events/ui/play_ui_mission_lobby_matchmade_players_join",
	mission_lobby_all_players_ready = "wwise/events/ui/play_ui_mission_lobby_all_players_ready",
	profile_preset_clicked = "wwise/events/ui/play_ui_click",
	system_popup_exit = "wwise/events/ui/play_ui_popup_close",
	talent_node_line_connection_start = "wwise/events/ui/play_ui_talents_line",
	end_screen_summary_card_expand = "wwise/events/ui/play_ui_eor_card_expand",
	talents_unequip_talent = "wwise/events/ui/play_ui_feats_unequip_talent",
	notification_invite_canceled = "wwise/events/ui/play_ui_mission_request_declined",
	tab_button_hovered = "wwise/events/ui/play_ui_mouseover",
	default_dropdown_expand = "wwise/events/ui/play_ui_dropdown_expand",
	character_appearence_enter = "wwise/events/ui/play_ui_silence",
	character_create_confirm = "wwise/events/ui/play_ui_enter_short",
	notification_achievement = "wwise/events/ui/play_hud_notifications_item_tier_1",
	social_menu_send_invite = "wwise/events/ui/play_ui_social_send",
	mission_board_receiving = "wwise/events/ui/play_ui_mission_board_receiving_transmission",
	talent_menu_enter = "wwise/events/ui/play_ui_silence",
	default_select = "wwise/events/ui/play_ui_silence",
	end_screen_summary_credits_zero = "wwise/events/ui/play_ui_eor_currency_credits_0",
	area_notification_popup_enter = "wwise/events/ui/play_hud_new_zone",
	end_screen_summary_credits_stop = "wwise/events/ui/play_ui_eor_currency_credits_stop",
	talent_node_clear = "wwise/events/ui/play_ui_feats_unequip_talent",
	social_menu_friend_request_reject = "wwise/events/ui/play_ui_click",
	social_menu_send_friend_request = "wwise/events/ui/play_ui_social_send",
	end_screen_summary_currency_summation = "wwise/events/ui/play_ui_eor_currency_summation",
	mission_vote_popup_enter = "wwise/events/ui/play_ui_mission_request",
	notification_crafting_material_recieved_pasteel = "wwise/events/ui/play_hud_notifications_plasteel_received",
	end_screen_summary_diamantine_progress = "ui_xp_progress",
	crafting_craft_button_activation = "wwise/events/ui/play_ui_npc_interacts_forge_button_fx",
	mission_board_node_hover = "wwise/events/ui/play_ui_mouseover",
	remove_profile_preset = "wwise/events/ui/play_ui_click",
	character_appearence_option_pressed = "wwise/events/ui/play_ui_click",
	end_screen_summary_card_retract = "wwise/events/ui/stop_ui_eor_stop_all_loops",
	social_menu_unfriend_player = "wwise/events/ui/play_ui_social_block",
	notification_default_enter = "wwise/events/ui/play_hud_notifications_default_enter",
	talents_equip_talent = "wwise/events/ui/play_ui_feats_equip_talent",
	options_slider_master_release = "wwise/events/ui/play_ui_click",
	notification_crafting_material_recieved_diamantine = "wwise/events/ui/play_hud_notifications_diamantine_received",
	options_slider_vo_click = "wwise/events/ui/play_ui_click",
	title_screen_enter = "wwise/events/ui/play_ui_silence",
	notification_trait_received_rarity_4 = "wwise/events/ui/play_hud_notifications_default_enter",
	weapons_equip_weapon = "wwise/events/ui/play_ui_character_loadout_equip_weapon",
	notification_weapon_skin_received = "wwise/events/ui/play_hud_notifications_item_tier_3",
	notification_default_exit = "wwise/events/ui/play_hud_notifications_default_exit",
	options_slider_music_release = "wwise/events/ui/play_ui_click"
}

local function _append_sound_events(sound_events)
	for key, value in pairs(sound_events) do
		ui_sound_events[key] = value
	end
end

_append_sound_events(require("scripts/ui/views/store_view/store_view_sound_events"))

return settings("UISoundEvents", ui_sound_events)
