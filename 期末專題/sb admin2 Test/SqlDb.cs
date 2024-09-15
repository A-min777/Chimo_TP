using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace sb_admin2_Test
{
	public class SqlDb
	{
		public static string GetConnectionString(string key)
		{
			var conn = System.Configuration.ConfigurationManager.ConnectionStrings[key];
			if (conn != null)
			{
				return conn.ConnectionString;
			}

			throw new ArgumentException(@"找不到連線字串的設定, 請檢查 key值( {key} )是否正確, 然後再試一次");

		}

		/// <summary>
		/// 允許一次執行多個sql command 且包在一個 transaction
		/// 外界在叫用之前, 請先確定 connection 的狀態是 open, 而且已經 begin transaction
		/// 執行完畢後, 外界需要視需要 commit or rollback transaction
		/// </summary>
		/// <param name="connection"></param>
		/// <param name="commands"></param>
		public static void ExecuteTransaction(IDbTransaction transaction, List<CommandDefinition> commands)
		{
			var connection = transaction.Connection;

			foreach (var command in commands)
			{
				connection.Execute(command.CommandText, command.Parameters, transaction, command.CommandTimeout, command.CommandType);
			}

		}

		public static void ExecuteTransaction(string connectionString, List<CommandDefinition> commands)
		{
			using (var conn = new System.Data.SqlClient.SqlConnection(connectionString))
			{
				conn.Open();
				var transaction = conn.BeginTransaction();
				try
				{
					// 叫用 ExecuteTransaction 自訂method
					ExecuteTransaction(transaction, commands);
					transaction.Commit();
				}
				catch (Exception)
				{
					transaction.Rollback();
					throw;
				}
			}

		}

	}
}