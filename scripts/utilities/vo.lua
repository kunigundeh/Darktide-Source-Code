LJ @scripts/utilities/vo.lua¥   
:  9  B'   9   BK  trigger_dialogue_eventheal_startget_event_data_payloaddialogue_extension  event_data event_name  ¯  c6  9  ' B' -    B  X 9B 9  BK  trigger_dialogue_eventget_event_data_payloadrapid_loosing_healthdialogue_systemhas_extensionScriptUnit_can_player_trigger_vo unit  dialogue_extension event_name event_data 	 Å 
7µ%6  9  ' B  X-  8  X6  9  ' B  B XX X 6  9 ' B  X6 9 9'	 B 6  9 ' B 9
' ' 	 B 9
' ' )	 BK  Àreviveelast_reviveeuser_memorystore_in_memorygameplay	timeManagersreviveremove_netdialogue_systemextensiondialogue_context_systemhas_extensionScriptUnit							






Interactions unit  8target_unit  8interaction_template_name  8vo_event 

dialogue_extension timeset dialogue_extension  È 	 z7	6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_event	itemget_event_data_payloadthrowing_itemdialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  projectile_template  dialogue_extension event_name event_data 	  *B9 96 9 ' B' -    B  X9 9 9  X+ X	+ 	  X		 X
+	 X
+	  	 X

 9
	B
' =

 9 
 BK  trigger_dialogue_eventout_of_ammofail_reasonget_event_data_payloadcurrent_ammunition_clipmax_ammunition_clipcurrent_ammunition_reservereload_faileddialogue_systemhas_extensionScriptUnitplayer_unit_player 					






_can_player_trigger_vo inventory_slot_component  +visual_loadout_extension  +shooter (dialogue_extension #event_name "ammo_reserve clip_capacity current_clip_amount full_clip is_out_of_ammo event_data   +V
6  9  ' B' 6 9 9' B -    B  X 9B 9  +	  9
	+ B 9
' ' 	 B 9
' ' )	 BK  ammo_hoggerlast_ammo_hoggeruser_memorystore_in_memory_faction_breed_name#trigger_faction_dialogue_queryget_event_data_payloadgameplay	timeManagersammo_hogdialogue_systemhas_extensionScriptUnit
_can_player_trigger_vo unit  ,dialogue_extension &event_name %timeset event_data 	  +b
6  9  ' B' 6 9 9' B -    B  X 9B 9  +	  9
	+ B 9
' ' 	 B 9
' ' )	 BK  health_hoggerlast_health_hoggeruser_memorystore_in_memory_faction_breed_name#trigger_faction_dialogue_queryget_event_data_payloadgameplay	timeManagershealth_hogdialogue_systemhas_extensionScriptUnit
_can_player_trigger_vo unit  ,dialogue_extension &event_name %timeset event_data 	 ÷  ,Ún6  9  ' B6  9  ' B
  X  XK   9' B-  9  X X' -   B  X 9B 9		 
 +  9
+ BK  À_faction_breed_name#trigger_faction_dialogue_queryget_event_data_payloadhead_shot"ranged_special_kill_thresholdnumber_of_headshotsincrease_timed_counterdialogue_context_systemdialogue_systemhas_extensionScriptUnit		



DialogueSettings _can_player_trigger_vo killer_unit  -distance  -dialogue_extension 'dialogue_context_extension "ranged_special_kill_threshold event_name event_data 	 Ã  .Ñ6  9  ' B6  9 ' B-  99
  X
  X  XK    X-   B  X 9B 9B= 9B==	 9
	 
 BK  Àtrigger_dialogue_eventtrigger_idinteractee_classvo_class_nameinteractor_classget_event_data_payloadinteraction_voconceptsdialogue_systemhas_extensionScriptUnit								


VOQueryConstants _can_player_trigger_vo interactor_unit  /interactee_unit  /interaction_vo_event  /interactor_ext )interactee_ext $query_concept !event_data  Á 
	 ²6  9  ' B' -    B  X-   B X- 989 9B= 9 	 BK   Àtrigger_dialogue_eventkiller_nameget_event_data_payloadvo_class_name	namekillstreakdialogue_systemhas_extensionScriptUnit					_can_player_trigger_vo _get_breed DialogueBreedSettings killer_unit   dialogue_extension event_name breed 	killer_source_name 	event_data  ¢ 
	 £ 	6  9  ' B' -    B  X6  9  ' B6  9  ' B- 9'  	 BK  Àhurt_light_vcetrigger_soundvisual_loadout_systemfx_systemextensionexpressiondialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo PlayerVoiceGrunts unit  damage  dialogue_extension event_name fx_extension visual_loadout_extension  ×  ~«   X-  9  X6 9  ' B6 9  ' B- 9'   BK  ÀÀland_heavy_vcetrigger_soundvisual_loadout_systemfx_systemextensionScriptUnit heavy_land_on_air_thresholdDialogueSettings PlayerVoiceGrunts unit  time_in_falling  fx_extension visual_loadout_extension  É 
  yµ	6  9  ' B  XK  ' 9 9B= 9 	 BK  trigger_dialogue_eventenemy_tagget_event_data_payload	namepouncing_enemydialogue_systemhas_extensionScriptUnit	target_unit  pouncing_breed  dialogue_extension event_name 
pouncing_breed_name  
event_data  É   (À6  9  ' B  X 9' BK  "number_of_player_suppressionsincrease_timed_counterdialogue_context_systemhas_extensionScriptUnitunit  context_extension  ©  cÇ6  9  ' B' -    B  X 9B 9  BK  trigger_dialogue_eventget_event_data_payloadledge_hangingdialogue_systemhas_extensionScriptUnit_can_player_trigger_vo unit  dialogue_extension vo_concept event_data 	  GßÐ   XD  XB6  9  ' B  X;6  9 ' B  X46  9  ' B 9B 9B=6  9 ' B 9B='	 6
 9 9' B -   	 B  X 9	 
 B 9'	 '
  B 9'	 '
 ) BK  has_friendly_firedlast_shot_frienduser_memorystore_in_memorytrigger_dialogue_eventgameplay	timeManagersfriendly_fireattacked_classvo_class_nameattacking_classget_event_data_payloaddialogue_systemextensiondialogue_context_systemhas_extensionScriptUnit
_can_player_trigger_vo attacking_unit  Hattacked_unit  Hdialogue_ext_attacking_unit /event_data ,dialogue_ext_attacked_unit 	#event_name timeset  Ù  W»å"   XT6  9  ' B6 99 9  B  XF
  XD6  9  ' B  X	6  9  ' B 9	'
 B-   B- 989  X+'   X99  X' X9X6  9 '	 B  X	6  9 '	 B 9B9' - 	 
 B  X			 9B=
 9	  B	K   Àtrigger_dialogue_eventkilled_typeget_event_data_payloadenemy_killplayer_profileget_contextmonster	tagsUNKNOWN!vo_triggers_enemy_kill_query	namenumber_of_killsincrease_timed_counterextensiondialogue_context_system
ownerplayer_unit_spawn
stateManagersdialogue_systemhas_extensionScriptUnit				"_get_breed DialogueBreedSettings _can_player_trigger_vo killer_unit  Xkilled_unit  Xkiller_dialogue_extension Oplayer_unit_spawn_manager Lplayer Hcontext_extension breed_data 1killed_unit_name *event_name event_data 	 » 	 ¤-  B  X6  9 ' B' -   B  X 9B== 9	 
 +  ' + BK  	imperium#trigger_faction_dialogue_queryvo_eventenemy_tagget_event_data_payloadplayer_enemy_attackdialogue_systemhas_extensionScriptUnit								_get_random_player _can_player_trigger_vo unit  breed_name  vo_event  random_player dialogue_extension concept event_data 	
 Í  Ë-    B  X6  9 ' B' - 	 
 B  X	
	 9B==
 9	  B	K  
trigger_dialogue_eventvo_eventenemy_tagget_event_data_payloadplayer_enemy_attackdialogue_systemhas_extensionScriptUnit					_get_closest_player_except _can_player_trigger_vo unit  breed_name  vo_event  position  filtered_player_unit  best_player dialogue_extension concept event_data 	 Ø 	 ¥
-  B  X6  9 ' B  -   B  X 9B 9  BK  	trigger_dialogue_eventget_event_data_payloaddialogue_systemhas_extensionScriptUnit
_get_random_player _can_player_trigger_vo vo_concept  random_player dialogue_extension concept event_data 	 ´  c±6  9  ' B' -    B  X 9B 9  BK  trigger_dialogue_eventget_event_data_payloadenemy_near_death_monsterdialogue_systemhas_extensionScriptUnit_can_player_trigger_vo unit  dialogue_extension event_name event_data 	 Ê 	 q»	6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_eventstory_typeget_event_data_payloadcombat_story_talkdialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  breed_name  dialogue_extension event_name event_data 	 ®  cÆ6  9  ' B' -    B  X 9B 9  BK  trigger_dialogue_eventget_event_data_payloadguidance_wrong_waydialogue_systemhas_extensionScriptUnit_can_player_trigger_vo unit  dialogue_extension event_name event_data 	    Ð
-   B 6  9  ' B' 
   X-   B  X
 9B' = 9  BK  	trigger_dialogue_eventexpression_reliefexpression_typeget_event_data_payloadexpressiondialogue_systemhas_extensionScriptUnit
_get_random_player _can_player_trigger_vo random_player dialogue_extension event_name event_data  ÿ   Ü	-   B 6  9  ' B' 
   X-   B  X 9B 9  BK  	trigger_dialogue_eventget_event_data_payload5seen_enemy_group_far_range_shooting_behind_coverdialogue_systemhas_extensionScriptUnit	_get_random_player _can_player_trigger_vo random_player dialogue_extension event_name event_data  Ý  .êç6  9  ' B  X 9B6 9  ) B-     B6  9 ' B'   X-   B  X 9B 9	B= 9
	 
 BK  
trigger_dialogue_eventvo_class_namedied_classget_event_data_payloadplayer_deathlocal_position	Unitstop_currently_playing_vodialogue_systemhas_extensionScriptUnit					
_get_closest_player_except _can_player_trigger_vo dead_player_unit  /dead_player_dialogue_ext )player_position 
closest_player closest_player_dialogue_ext event_name event_data 	 Å 	 mù	6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_eventability_nameget_event_data_payloadcombat_abilitydialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  vo_tag  dialogue_extension event_name event_data 	 Ã  e	6  9  ' B' -    B  X
 9B' = 9  BK  trigger_dialogue_eventvectorhorde_typeget_event_data_payloadheard_hordedialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  dialogue_extension vo_concept event_data 	 £ 	 '  -     B  X  9 B  9 B  9 B====  9 	 
 BK  trigger_dialogue_eventobserver_vo_profileobserver_vo_classdistancelook_at_tagget_voice_profilevo_class_nameget_event_data_payloadlook_at	




_can_player_trigger_vo dialogue_extension  tag  distance  event_name event_data 	observer_vo_class observer_vo_profile 	      9  B  9 B  9 B====	  9 
  +   + BK  #trigger_faction_dialogue_queryobserver_vo_profileobserver_vo_classdistancelook_at_tagget_voice_profilevo_class_nameget_event_data_payloaddialogue_extension  faction_event  faction_name  tag  distance  event_data observer_vo_class observer_vo_profile  ø 	 ®6  9  ' B' -    B  X 9B=== 9	 
 BK  trigger_dialogue_eventdistanceenemy_unitenemy_tagget_event_data_payloadseen_enemydialogue_systemhas_extensionScriptUnit					_can_player_trigger_vo unit  enemy_tag  enemy_unit  distance  dialogue_extension event_name event_data 	 ù 	 »6  9  ' B' -    B  X 9B=== 9	 
 BK  trigger_dialogue_eventdistanceenemy_unitenemy_tagget_event_data_payloadheard_enemydialogue_systemhas_extensionScriptUnit					_can_player_trigger_vo unit  enemy_tag  enemy_unit  distance  dialogue_extension event_name event_data 	 Ë 	 qÈ	6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_eventtrigger_idget_event_data_payloadgeneric_mission_vodialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  trigger_id  dialogue_extension event_name event_data 	 Ì 	 qÓ	6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_eventstory_nameget_event_data_payloadenvironmental_storydialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  story_name  dialogue_extension event_name event_data 	 à 
 zÞ	6  9  ' B' -    B  X
 9B== 9 	 BK  trigger_dialogue_eventvo_eventenemy_tagget_event_data_payloadplayer_enemy_alertdialogue_systemhas_extensionScriptUnit	_can_player_trigger_vo unit  breed_name  vo_event  dialogue_extension concept event_data 	 Ï 	 sé6  9  ' B' -    B  X	 9B= 9  BK  trigger_dialogue_eventenemy_tagget_event_data_payloadpounced_by_special_attackdialogue_systemextensionScriptUnit_can_player_trigger_vo unit  breed_name  dialogue_extension concept_name event_data 	 í   4ô6  9  ' B  X	6  9  ' B 9' BK  number_of_knocked_downsincrease_timed_counterextensiondialogue_context_systemhas_extensionScriptUnitdowned_unit  context_extension   	 qû6  9  ' B' -    B  X 9B 9B= 9  +  9	+
 BK  _faction_breed_name#trigger_faction_dialogue_queryvo_class_nameplayer_classget_event_data_payload knocked_down_multiple_timesdialogue_systemhas_extensionScriptUnit_can_player_trigger_vo downed_unit  dialogue_extension vo_concept query_data 	   W   X6  9  ' B6  9  ' B-  9'   BK  Àcatapulted_vcetrigger_soundvisual_loadout_systemfx_systemextensionScriptUnitPlayerVoiceGrunts unit  fx_extension visual_loadout_extension    W   X6  9  ' B6  9  ' B-  9'   BK  Àcatapulted_land_vcetrigger_soundvisual_loadout_systemfx_systemextensionScriptUnitPlayerVoiceGrunts unit  fx_extension visual_loadout_extension  ñ 
 	-    B- 9 896 9  ' B  X  X	 9B  9 	 BK   Àtrigger_dialogue_eventget_event_data_payloaddialogue_systemhas_extensionScriptUnitassault_vo_event	name	_get_breed DialogueBreedSettings unit  breed assault_vo_event_name dialogue_ext event_data event_name  ö   B¦6  9  ' B  X	 9B'  9  BK  trigger_dialogue_eventtake_positionget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  dialogue_ext event_data event_name   	  P°6  9  ' B  X
 9B' = 9  BK  trigger_dialogue_eventenemy_tagalerted_idleget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  breed_name  dialogue_ext event_data event_name  © 	 ©À+    X-    B X- B   X- 9  9 BK  	À	nameplayer_enemy_alert_event						_get_random_non_threatening_player_unit _get_random_player Vo enemy_unit  enemy_breed  vo_event  optional_non_threatening_player  player_unit  ô   BÍ6  9  ' B  X	 9B'  9  BK  trigger_dialogue_eventranged_idleget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  dialogue_ext event_data event_name  ó   BÖ6  9  ' B  X	 9B'  9  BK  trigger_dialogue_eventtake_coverget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  dialogue_ext event_data event_name  ô   Bß6  9  ' B  X	 9B'  9  BK  trigger_dialogue_eventcall_backupget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  dialogue_ext event_data event_name  û 	  Uè6  9  ' B  X	 9B  9  BK  trigger_dialogue_eventget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  spawn_event_name  dialogue_ext event_data event_name  ñ   Bñ6  9  ' B  X	 9B'  9  BK  trigger_dialogue_eventskulkingget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  dialogue_ext event_data event_name  é   Gú6  9  ' B  X 9B 9  BK  trigger_dialogue_eventget_event_data_payloaddialogue_systemhas_extensionScriptUnitunit  event_name  dialogue_extension event_data  Ô 
 
 r6  9  ' B6  '  B  X'  9B=  X= 9	 	 BK  trigger_dialogue_eventenemy_tagtrigger_idget_event_data_payloadgeneric_enemy_vo_eventh[enemy_generic_vo_event] No trigger_id found, make sure a vo_event is defined in minion action datafassertdialogue_systemhas_extensionScriptUnit




unit  trigger_id  breed_name_or_nil  dialogue_extension event_name event_data 	 ¡ 	  V6  9  ' B  X
'  9B= 9  BK  trigger_dialogue_eventattack_nameget_event_data_payloadenemy_special_attackdialogue_systemhas_extensionScriptUnitunit  event_type  dialogue_extension event_name 	event_data  Û   ?¢6  9  ' B 9B 9  BK  trigger_dialogue_eventget_event_data_payloaddialogue_systemextension_inputScriptUnitunit  concept  dialogue_input 	event_table    	  a¨6  9  ' B'  9B= 9  BK  trigger_dialogue_eventstarter_lineget_event_data_payloadmission_briefdialogue_systemextension_inputScriptUnitunit  mission_brief_starter_line  dialogue_input event_name 
event_table   	  V°6  9  ' B  X
'  9B= 9  BK  trigger_dialogue_eventtrigger_idget_event_data_payloadmission_infodialogue_systemhas_extensionScriptUnitunit  trigger_id  dialogue_extension event_name 	event_data  Ù  ¼-    B  X6  9 ' B  9B=  X 9	 
 BK  trigger_dialogue_eventtrigger_idget_event_data_payloaddialogue_systemhas_extensionScriptUnit					_get_mission_giver_unit voice_profile  concept  trigger_id  unit dialogue_extension event_name event_data  ¡ 	  VÌ   X6  9  ' B'  9B=  X 9  BK  trigger_dialogue_eventcategoryget_event_data_payloadconfessional_vodialogue_systemhas_extensionScriptUnitunit  category  dialogue_extension event_name event_data  Â  	 ¤Ù6  9  ' B6  9 ' B  X  X 9B'  9B==	 9
  BK  trigger_dialogue_eventinteractor_voice_profilevo_eventget_event_data_payloadnpc_interacting_voget_voice_profiledialogue_systemhas_extensionScriptUnit	




unit  interactor_unit  vo_event  dialogue_ext_npc dialogue_ext_interactor interactor_voice_profile event_name 
event_data   	  Rç	6  9  ' B  X
'  9B= 9  BK  trigger_dialogue_eventvo_eventget_event_data_payloadnpc_vodialogue_systemhas_extensionScriptUnit	unit  vo_event  dialogue_ext_npc event_name 	event_data  ® 	  Vò6  9  ' B  X
'  9B= 9  BK  trigger_dialogue_eventtrigger_idget_event_data_payload'mission_giver_conversation_starterdialogue_systemhas_extensionScriptUnitunit  trigger_id  dialogue_extension event_name 	event_data  ½ 	  \ü	6  B  X6 9 ' B'  9B=  9  BK  trigger_dialogue_eventtrigger_idget_event_data_payloadnpc_story_talkdialogue_systemhas_extensionScriptUnit_get_random_vox_unit	trigger_id  vox_unit dialogue_extension 
event_name 	event_data  Í  4-  9 - 8 X+ X+   X(  X&6 99' 	 9
 B6	 9		
	 9		  B	6
	 9


	  B
6	 9	 
 '  B6	 9	  
 B6	 9	  
 BK  ÀÀtrigger_resource_eventvoice_fx_presetset_source_parametermake_auto_sourceWwiseWorldwwise_world
worldvoice_over_unitvoice_previewvoice_over_spawn
stateManagersvoice_fx_rtpc_none,character_appearence_stop_voice_preview	



UISoundEvents VoiceFxPresetSettings world  5voice_fx_preset  5sound_event  5stop_sound_event 2voice_fx_preset_rtpc 0has_voice_fx_preset +voice_over_spawn_manager #voice_profile "unit wwise_world source  å 
 %6  9  ' B  X 9B -  99 X=X-  99 X=X-  99	 X=
 9 	 BK  Àtrigger_dialogue_eventitem_tagon_demand_vo_tag_itemenemy_tagon_demand_vo_tag_enemytrigger_idon_demand_com_wheelconceptsget_event_data_payloaddialogue_systemhas_extensionScriptUnit					

VOQueryConstants unit  &concept  &trigger_id  &dialogue_extension  event_data event_name  Ñ   e±	6  9  ' B  X'  9B=5  9 	 +
   + BK  $trigger_factions_dialogue_query  imperiumnpctrigger_idget_event_data_payloadstart_banterdialogue_systemhas_extensionScriptUnit	unit  trigger_id  dialogue_extension event_name event_data 
factions  @    1¼K  dialogue_extension_unit  dialogue_extension      %ÁÂ9  +  6  BH
9 X9XF
R
ù  X6 9 '	 B  X	 9
   BL X6 9	'
 '	 
 BK  7Play UI VO event, no VO unit found for profile %s DialogueSystemwarningLogplay_local_vo_eventsdialogue_systemhas_extensionScriptUnit
_unit_vo_profile_name
pairs_unit_extension_data

dialogue_system  &vo_rules  &voice_profile  &wwise_route_key  &on_play_callback  &unit_extensions $vo_unit #  _ unit_ext  dialogue_extension 	  	  VÚ	6  9  ' B  X
'  9B= 9  BK  trigger_dialogue_eventvo_line_idget_event_data_payloadcutscene_vo_linedialogue_systemhas_extensionScriptUnit	unit  vo_line_id  dialogue_extension event_name 	event_data     Jè6  9  ' B  X'  9B' = 9  BK  trigger_dialogue_eventdebug_votrigger_idget_event_data_payloadwarningdialogue_systemhas_extensionScriptUnitunit  dialogue_extension event_name 
event_data     &ó6  9  ' B  X 9D X+  L K  
breedunit_data_systemhas_extensionScriptUnitunit  unit_data_ext 	     .ü6   9  9    9  B    XK  6  99 9' B 9B 9 B6  99	 9
B ) )ÿÿM8
	99
8  X6 9 	 BOôL remove
tableplayer_unitunits_lookupalive_playersplayer_unit_spawnget_side_from_name!get_default_player_side_nameside_systemsystemextensionis_servergame_session
stateManagers


is_server (side_system 
side_name side player_unit_spawn_manager alive_players   i player 
 Ñ   h
-   B    X  )   X6  9)  B8 9L K  player_unitrandom	math
_get_alive_players alive_players num_alive_players random_index random_player  á 6µ-  B  X1 )   X-6  9- B)  ) M
89 X	-	 -
 

 
 
<
	Oö-  )   X6 9+  )  )	 M- 8
6 86 9   B X  OòL K  ÀdistanceVector3POSITION_LOOKUP	huge	mathplayer_unit
clear
table					_get_alive_players valid_player_units position  7filtered_player_unit  7alive_players 4num_alive_players 0
  i 	player_unit num_valid_player_units 
closest_distance best_player_unit   i player_unit player_position 	distance  ý 
 /Ø¿6  9  ' B-  B6 9- B)  ) M89	 9
 B  X	)	  	 X	6	 9		-
  B	Oï-  )   X- 6 9	)  B8L +  L Àrandom	mathinsertthreatplayer_unit
clear
tableperception_systemextensionScriptUnit					_get_alive_players valid_player_units minion_unit  0perception_extension *num_alive_players (  i player_unit threat 
NUM_VALID_PLAYER_UNITS selection 
 Ó   nÕ6   B   6 9)  B8 -   D random	math _get_all_vox_voice_profiles_get_mission_giver_unit vox_voice_profiles 
num_voice_profiles 	random_index voice_profile  Ì   ¬Ý-   9   4  )   ) M8 -  896	 
 B	H6 9  BFRùOðL  Àinsert
table
pairswwise_voicesvoice_classes_npc					DialogueBreedSettings npc_vo_classes vox_voice_profiles   i vo_class class_settings voice_profiles   _ voice_profile   Æ   Uì6  996  99 9B  X
 9  B6  '   BL K  C[trigger_mission_giver_vo] No unit found for voice_profile(%s)fassertvoice_over_unitis_servergame_sessionvoice_over_spawn
stateManagersvoice_profile  voice_over_spawn_manager is_server unit    
 (\ö   X+ L 9   X9 X+ L X X9 X+ L X X9 X+ L X
 X9	 X+ L X+ L K  is_hogtiedfriends_closeis_pounced_downpounced_by_special_attackis_ledge_hangingledge_hanging	trueis_knocked_downknocked_down_context					


dialogue_extension  )concept_name  )context_data #    
46  9'   ' &  BK  ! breed_name = %s, event= %s DialogueSystem	infoLogevent_category  breed_name  vo_event   â   ¬Î 6   ' B 6  ' B6  ' B6  ' B6  ' B6  ' B4  , 5 3 =	3 =
3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3! = 3# ="3% =$3' =&3) =(3+ =*3- =,3/ =.31 =033 =235 =437 =639 =83; =:3= =<3? =>3A =@3C =B3E =D3G =F3I =H3K =J3M =L3O =N3Q =P3S =R3U =T3W =V3Y =X3[ =Z3] =\3_ =^3a =`3c =b3e =d3g =f3i =h3k =j3m =l3o =n3q =p3s =r3u =t3w =v3y =x3{ =z3} =|3 =~3 =3 =3 =3 =3 =3 =3 =3 =3 3 3	 4  3
 3 3 7 3 7 3 3 3 2  L     _get_all_vox_voice_profiles _get_random_vox_unit       play_debug_vo_event cutscene_vo_event play_local_vo_events reinforcements start_banter_vo_event on_demand_vo_event !play_voice_fx_preset_preview play_npc_story 'mission_giver_conversation_starter play_npc_vo_event "play_npc_interacting_vo_event confessional_vo_event mission_giver_vo_event mission_giver_mission_info &mission_giver_mission_brief_event mission_giver_event "enemy_vo_special_attack_event enemy_generic_vo_event enemy_vo_event enemy_skulk_event enemy_spawn_vo_event enemy_call_backup_event enemy_take_cover_event enemy_ranged_idle_event $random_player_enemy_alert_event enemy_alerted_idle_event enemy_take_position_event enemy_assault_event !player_catapulted_land_event player_catapulted_event -player_knocked_down_multiple_times_event &knocked_down_multiple_times_event $player_pounced_by_special_event player_enemy_alert_event !environmental_story_vo_event generic_mission_vo_event heard_enemy_event seen_enemy_event faction_look_at_event look_at_event heard_horde play_combat_ability_event player_death_event %enemy_shooting_from_covers_event play_expression_relief_vo $player_guidance_wrong_way_event  monster_combat_conversation "monster_health_critical_event player_vo_event_by_concept 0closest_player_except_vo_enemy_attack_event !player_vo_enemy_attack_event enemy_kill_event friendly_fire_event player_ledge_hanging_event player_suppressed_event pouncing_alert_event player_land_event player_damage_event killstreak_event  player_interaction_vo_event head_shot_event health_hog_event ammo_hog_event out_of_ammo_event throwing_item_event interaction_start_event health_critical_eventhealth_station   1scripts/settings/dialogue/vo_query_constants7scripts/settings/dialogue/voice_fx_preset_settings(scripts/settings/ui/ui_sound_events*scripts/utilities/player_voice_grunts0scripts/settings/dialogue/dialogue_settings6scripts/settings/dialogue/dialogue_breed_settingsrequire                   
    #  5 % @ 7 T B ` V l b  n     ©   ³ « ¾ µ Å À Î Ç ã Ð å 	#/%91D;NFZPe\wgy¬¹®Æ»ÑÈÜÓçÞñéùôû#-&>0K@TM]Vf_ohxqz¦¢®¨¸°È¼×ÌåÙðçúòü	/:1?<VBcZphz½ÓÛÛêêô
DialogueBreedSettings ©DialogueSettings ¦PlayerVoiceGrunts £UISoundEvents  VoiceFxPresetSettings VOQueryConstants Vo _get_breed _get_alive_players  _get_random_player  _get_closest_player_except  _get_random_non_threatening_player_unit  _can_player_trigger_vo  _get_mission_giver_unit  _log_vo_event  Interactions valid_player_units   