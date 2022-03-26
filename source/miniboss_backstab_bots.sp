#include <sdkhooks>
#include <tf2_stocks>

float backstabDamage = 750.0;

public Plugin myinfo = 
{
	name = "[TF2] MiniBoss Anti-Backstab Bots",
	author = "Officer Spy",
	description = "Prevents bot players from instantly killing giant robots with backstabs.",
	version = "1.0.1",
	url = ""
};

public OnClientPutInServer(int client)
{
	SDKHook(client, SDKHook_OnTakeDamage, SDKOnPlayerTakeDamage);
}

public Action SDKOnPlayerTakeDamage(int victim, int& attacker, int& inflictor, float& damage, int& damagetype, int& weapon, float damageForce[3], float damagePosition[3], int damagecustom)
{
	//In the case the attacking entity is not one of our clients.
	if (!IsValidClientIndex(attacker))
		return Plugin_Continue;
	
	//Override the backstab damage from bot players against miniboss clients.
	if (IsMiniBoss(victim) && IsFakeClient(attacker) && damagecustom == TF_CUSTOM_BACKSTAB && damagetype & DMG_CRIT)
	{
		damage = backstabDamage / 3.0;
		
		return Plugin_Changed;
	}
	
	return Plugin_Continue;
}

stock bool IsMiniBoss(int client)
{
	return !!GetEntProp(client, Prop_Send, "m_bIsMiniBoss");
}

stock bool IsValidClientIndex(int client)
{
	if (client > 0 && client <= MaxClients && IsClientInGame(client))
		return true;
		
	return false;
}